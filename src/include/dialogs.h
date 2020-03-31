typedef struct dialog_item {
  UBYTE x, y;  
  unsigned char * text;
  UBYTE key; 
  struct dialog_item* next;
} dialog_item;

void show_dialog_window(const UBYTE lines, const dialog_item* item);

const dialog_item const dylan_dialog = {0, 0, "-HELLO, DIZZY!", J_B, &dylan_dialog1};
const dialog_item const dylan_dialog1 = {0, 1, "-HI, DYLAN!", J_B, &dylan_dialog2};
const dialog_item const dylan_dialog2 = {0, 2, "-I'VE LOST MY", 0, &dylan_dialog3};
const dialog_item const dylan_dialog3 = {3, 3, "ELEVATOR KEY!", J_B, &dylan_dialog4};
const dialog_item const dylan_dialog4 = {0, 4, "-OK, I'LL SEE", 0, &dylan_dialog5};
const dialog_item const dylan_dialog5 = {2, 5, "WHAT I CAN DO!", J_B, 0};


const dialog_item const troll_dialog = {0, 0, "-EERGH!!", J_B, &troll_dialog1};
const dialog_item const troll_dialog1 = {0, 1, "-EXCUSE ME, SIR?", J_B, &troll_dialog2};
const dialog_item const troll_dialog2 = {0, 2, "-THRE CO'NS", 0, &troll_dialog3};
const dialog_item const troll_dialog3 = {8, 3, "TO PASS!", J_B, 0};

const dialog_item const game_over_dialog = {0, 1, "G A M E  O V E R", 0, &game_over_dialog1};
const dialog_item const game_over_dialog1 = {2, 3, "PRESS  START", J_START, 0}; 

const dialog_item const start_dialog = {3, 1, "DIZZY  AND", 0, &start_dialog1};
const dialog_item const start_dialog1 = {0, 2, "THE MUSHROOM PIE", 0, &start_dialog2};
const dialog_item const start_dialog2 = {2, 4, "PRESS  START", J_START, 0};
