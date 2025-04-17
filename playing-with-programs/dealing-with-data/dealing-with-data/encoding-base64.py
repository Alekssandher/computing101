from pwn import*
import base64

password = base64.b64encode(b"\x832\xdb\xc4\xc5\xd0\xaa\x8a")

p = process("/challenge/runme")

p.send(password)

print(p.readall().decode())