edi = 14

def recurse(edx, esi):
    eax = edx - esi
    ebx = (eax/2) + esi

    if ebx < edi:
        recurse(edx, ebx + 1)
        eax += ebx

    elif ebx > edi:
        recurse(ebx - 1, esi)
        eax += ebx

    else:
        
        eax += ebx
        return eax

print(recurse(14, 0))
print("hey")

# edx = 14
# esi = 0
# ebx = 0
# eax = 0

# while (ebx != edi):
#     eax = edx - esi
#     ebx = (eax/2) + esi

#     if ebx < edi:
#         print(ebx + eax)
#         esi = ebx + 1

#     elif ebx > edi:
#         print(ebx + eax)
#         edx = ebx - 1

#     else:
#         eax += ebx

#print(eax)
