typedef struct dialog_item {
  UBYTE x, y;  
  unsigned char * text;
  UBYTE key; 
  struct dialog_item* next;
} dialog_item;

void show_dialog_window(const UBYTE lines, const dialog_item* item);

const dialog_item const troll_dialog = {0, 0, "-EERGH!!", J_B, &troll_dialog1};
const dialog_item const troll_dialog1 = {0, 1, "-EXCUSE ME, SIR?", J_B, &troll_dialog2};
const dialog_item const troll_dialog2 = {0, 2, "-THRE CO'NS", 0, &troll_dialog3};
const dialog_item const troll_dialog3 = {8, 3, "TO PASS!", J_B, 0};
