#ifndef __BANKS_STACK_INCLUDE
#define __BANKS_STACK_INCLUDE

#define refresh_bank SWITCH_ROM_MBC1((*__banks_sp))

extern unsigned char * __banks_sp;

void push_bank(const unsigned char n);
void pop_bank();
void set_bank(const unsigned char n);
unsigned char get_bank();

#endif