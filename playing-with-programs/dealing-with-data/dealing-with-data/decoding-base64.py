from pwn import *
import base64

correct_password = base64.b64decode(b"iAb/uzx0uJQ=")

p = process("/challenge/runme")

p.send(correct_password)

print(p.readall().decode())