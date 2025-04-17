from pwn import*

p = process("/challenge/runme")

payload = b"\xdcr\x9dn\x14W\xab\xbe".hex()[::-1]

p.send(payload)

print(p.readall().decode())