from pwn import *
import base64

p = process("/challenge/runme")

correct_password = b"\xccwH>x\x1aUL"

correct_password = base64.b64encode(correct_password)
correct_password = correct_password.hex().encode("l1")
correct_password = correct_password[::-1]
correct_password = correct_password.hex().encode("l1")

payload = base64.b64encode(correct_password)
payload = payload.hex().encode('latin-1')
payload = payload.hex().encode('latin-1')
payload = payload.hex().encode('latin-1')

p.send(payload)

print(p.readall().decode())

print(payload)