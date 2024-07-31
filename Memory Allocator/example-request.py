import socket

METHOD = b"GET"
URL = b"/"
HEADERS = b"Host: www.caltech.edu"

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# By default, web browsers request unencrypted websites on port 80.
# We want to simulate a "default" request here.
client.connect(("caltech.edu", 80))
#request = f"{METHOD} {URL} HTTP/1.1\r\nHEADERS\r\nConnection: close\r\n\r\n"
request = METHOD + b" " + URL + b" " + b"HTTP/1.1\r\n" + HEADERS + b"\r\nConnection: close\r\n\r\n"
print(request)
client.send(request)
response = client.recv(4096)
print(response.decode())