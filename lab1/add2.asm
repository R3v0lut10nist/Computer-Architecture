.text
main:

# code starts from the line below

lui     $t0, 0x1000     # temporary register t0 = 0x10000000
ori     $t0, 0x0001     # t0 = 0x10000000 | 0x0001 = 0x10000001

lui     $t1, 0x2000
ori     $t1, 0x0002

# v0 - register for return value
add     $v0, $t0, $t1   # v0 = t0 + t1 = 0x30000003
