#include <gb/gb.h>

unsigned char __banks_storage[8] = {0};
unsigned char * __banks_sp = __banks_storage;

void push_bank(const unsigned char n) NONBANKED {
    *(++__banks_sp) = n;
    SWITCH_ROM_MBC1(n);
}

void pop_bank() NONBANKED {
    unsigned char n = *(--__banks_sp);
    SWITCH_ROM_MBC1(n);
}

void set_bank(const unsigned char n) NONBANKED {
    *__banks_sp = n;
    SWITCH_ROM_MBC1(n);
}

unsigned char get_bank() NONBANKED {
    return (*__banks_sp);
}
