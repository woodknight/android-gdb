#include <iostream>
#include <arm_neon.h>

int main()
{
    // add 3
    uint8_t a[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    uint8_t b[16] = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3};
    uint8_t c[16];

    uint8x16_t av = vld1q_u8(a);
    uint8x16_t bv = vld1q_u8(b);

    uint8x16_t cv = vaddq_u8(av, bv);

    vst1q_u8(c, cv);

    for(int i = 0; i < 16; i++)
        std::cout << int(c[i]) << std::endl;

    return 0;
}

