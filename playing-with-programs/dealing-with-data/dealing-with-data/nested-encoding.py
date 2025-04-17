from pwn import*

password = "vsxoinjj"

for i in range(1, 5):
    password = password.encode("ascii").hex()

with open("pass.txt", "w") as f:
    f.write(password)

p = process(["/challenge/runme", "pass.txt"])

print(p.readall().decode())

