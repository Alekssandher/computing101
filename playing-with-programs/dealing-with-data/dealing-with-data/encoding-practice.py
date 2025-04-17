from pwn import*

p = process("/challenge/runme")

hex_bytes = b"\xd1\xa2\x9e\xfc\xfd\xdc\x97\xd3"

binary_str = ''.join(format(b, '08b') for b in hex_bytes)
p.send(binary_str.encode())

print(p.readall().decode())