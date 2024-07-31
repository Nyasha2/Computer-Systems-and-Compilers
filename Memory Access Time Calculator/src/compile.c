#include "compile.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t COUNTER = 0;
bool check_num(int64_t number);
int64_t get_value(node_t *node);
bool is_constant(node_t *node);

bool compile_ast(node_t *node) {
    if (node == NULL) {
        return false;
    }

    if (node->type == NUM) {
        int64_t value = (int64_t)((num_node_t *) node)->value;
        printf("\tmovq $%ld, %%rdi\n", value);
    }

    else if (node->type == PRINT) {
        node_t *expression = ((print_node_t *) node)->expr;
        compile_ast(expression);
        printf("\tcallq %s\n", "print_int");
    }

    else if (node->type == SEQUENCE) {
        sequence_node_t *seq = (sequence_node_t *) node;
        node_t **statements = seq->statements;
        size_t counter = seq->statement_count;
        for (size_t i = 0; i < counter; i++) {
            compile_ast(statements[i]);
        }
    }

    else if (node->type == BINARY_OP) {
        binary_node_t *bin = (binary_node_t *) node;
        char op = bin->op;
        if (is_constant(node)) {
            int64_t result = get_value(node);
            printf("\tmovq $%ld, %%rdi\n", result);
        }
        else {
            if (op == '+') {
                compile_ast(bin->left);
                printf("\tpushq %%rdi\n");
                compile_ast(bin->right);
                printf("\tpopq %%rax\n");
                printf("\taddq %%rax, %%rdi\n");
            }

            else if (op == '*') {
                node_t *left = ((node_t *) bin->left);
                node_t *right = ((node_t *) bin->right);
                if (left->type == NUM && check_num(((num_node_t *) left)->value)) {
                    int64_t offset = log2(((num_node_t *) left)->value);
                    compile_ast(right);
                    printf("\tshlq $%ld, %%rdi\n", offset);
                }
                else if (right->type == NUM && check_num(((num_node_t *) right)->value)) {
                    int64_t offset = log2(((num_node_t *) right)->value);
                    compile_ast(left);
                    printf("\tshlq $%ld, %%rdi\n", offset);
                }
                else {
                    compile_ast(left);
                    printf("\tpushq %%rdi\n");
                    compile_ast(right);
                    printf("\tpopq %%rax\n");
                    printf("\timulq %%rax, %%rdi\n");
                }
            }

            else if (op == '-') {
                compile_ast(bin->right);
                printf("\tpushq %%rdi\n");
                compile_ast(bin->left);
                printf("\tpopq %%rax\n");
                printf("\tsubq %%rax, %%rdi\n");
            }

            else if (op == '/') {
                compile_ast(bin->left);
                printf("\tpushq %%rdi\n");
                compile_ast(bin->right);
                printf("\tpopq %%rax\n");
                printf("\tcqto\n");
                printf("\tidivq %%rdi\n");
                printf("\tmovq %%rax, %%rdi\n");
            }
            else {
                return false;
            }
        }
    }

    else if (node->type == VAR) {
        var_node_t *var = (var_node_t *) node;
        char name = var->name;
        size_t offest = ((name - 'A' + 1) * 8);
        printf("\tmovq %zu(%%rbp), %%rdi\n", -offest);
    }

    else if (node->type == LET) {
        let_node_t *let = (let_node_t *) node;
        char name = let->var;
        size_t offest = ((name - 'A' + 1) * 8);
        compile_ast(let->value);
        printf("\tmovq %%rdi, %zu(%%rbp)\n", -offest);
    }

    else if (node->type == IF) {
        if_node_t *conditional = (if_node_t *) node;
        binary_node_t *condition = conditional->condition;
        compile_ast(condition->left);
        printf("\tpushq %%rdi\n");
        compile_ast(condition->right);
        printf("\tpopq %%rsi\n");
        printf("\tcmpq %%rdi, %%rsi\n");
        COUNTER++;
        size_t counter = COUNTER;

        if (condition->op == '<') {
            printf("\tjge .LBB0_%zu\n", counter);
        }
        else if (condition->op == '>') {
            printf("\tjle .LBB0_%zu\n", counter);
        }
        else if (condition->op == '=') {
            printf("\tjne .LBB0_%zu\n", counter);
        }
        compile_ast(conditional->if_branch);
        printf("\tjmp END_%zu\n", counter);
        printf(".LBB0_%zu:\n", counter);
        compile_ast(conditional->else_branch);
        printf("END_%zu:\n", counter);
    }

    else if (node->type == WHILE) {
        while_node_t *loop = (while_node_t *) node;
        binary_node_t *condition = loop->condition;
        COUNTER++;
        size_t counter = COUNTER;
        printf("WHILE_%zu:\n", counter);
        compile_ast(condition->left);
        printf("\tpushq %%rdi\n");
        compile_ast(condition->right);
        printf("\tpopq %%rsi\n");
        printf("\tcmpq %%rdi, %%rsi\n");

        if (condition->op == '<') {
            printf("\tjge END_%zu\n", counter);
        }
        else if (condition->op == '>') {
            printf("\tjle END_%zu\n", counter);
        }
        else if (condition->op == '=') {
            printf("\tjne END_%zu\n", counter);
        }
        compile_ast(loop->body);
        printf("\tjmp WHILE_%zu\n", counter);
        printf("END_%zu:\n", counter);
    }

    else {
        return false;
    }
    (void) node;
    return true;
}

bool check_num(int64_t number) {
    return number > 0 && ((number & (number - 1)) == 0);
}

bool is_constant(node_t *node) {
    if (node->type == NUM) {
        return true;
    }
    else if (node->type == BINARY_OP) {
        binary_node_t *b_node = (binary_node_t *) node;
        if (b_node->op == '>' || b_node->op == '<' || b_node->op == '=') {
            return false;
        }
        return is_constant(b_node->left) && is_constant(b_node->right);
    }
    return false;
}

int64_t get_value(node_t *node) {
    if (node->type == NUM) {
        num_node_t *num = (num_node_t *) node;
        return (int64_t) num->value;
    }
    binary_node_t *bin = (binary_node_t *) node;
    int64_t left = get_value(bin->left);
    int64_t right = get_value(bin->right);
    char op = bin->op;
    if (op == '+') {
        return left + right;
    }
    else if (op == '-') {
        return left - right;
    }
    else if (op == '*') {
        return left * right;
    }
    else {
        return left / right;
    }
    return 0;
}
