from pwn import*

p = process("/challenge/runme")

value = 0b1100001011010100111010111111100010001001101111001111111010110111

num_bits = value.bit_length()
num_bytes = (num_bits + 7) // 8

raw_b = value.to_bytes(num_bytes, byteorder='big')
p.send(raw_b)

print(p.readall().decode())