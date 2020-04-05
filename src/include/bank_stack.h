unsigned char banks[8];
unsigned char * banks_sp = banks;

void push_bank(const unsigned char n) NONBANKED {
    *(++banks_sp) = n;
    SWITCH_ROM_MBC1(n);
}

void pop_bank() NONBANKED {
    SWITCH_ROM_MBC1(*(--banks_sp));
}

void set_bank(const unsigned char n) NONBANKED {
    *banks_sp = n;
    SWITCH_ROM_MBC1(n);
}
