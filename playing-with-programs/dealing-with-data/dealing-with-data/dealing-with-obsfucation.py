from pwn import*
import base64

p = process("/challenge/runme")

password = base64.b64encode(b"\xa65\x1f\xfd0\xce\xaf\xf7")
password = b"".join(format(c, "08b").encode("latin1") for c in password)
password = password.hex().encode()
password = base64.b64encode(password)

p.send(password)

print(p.readall().decode())