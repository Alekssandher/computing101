from pwn import*

p = process("/challenge/runme")

password = "qpfzebsy".encode("ascii").hex()

p.send(password)

print(p.readall().decode())