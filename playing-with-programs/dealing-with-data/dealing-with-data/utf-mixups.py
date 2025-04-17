from pwn import*

payload = "yufsqaev".encode("utf-16")

with open("lglr", "wb") as f:
    f.write(payload)

p = process("/challenge/runme")

print(p.readall().decode())