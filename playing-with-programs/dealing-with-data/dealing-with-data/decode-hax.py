from pwn import*

p = process("/challenge/runme")

raw_bytes = bytes.fromhex("83a3c7dddbeeebc2")
p.send(raw_bytes)

print(p.readall().decode())