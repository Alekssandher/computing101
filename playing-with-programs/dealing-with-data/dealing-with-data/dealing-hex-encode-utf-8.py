from pwn import*

data = "🎆 🌳 😂 😌".encode().hex()

with open("pqfg", "w") as f:
    f.write(data)

p = process("/challenge/runme")

print(p.readall().decode())