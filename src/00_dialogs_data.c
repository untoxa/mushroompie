#pragma bank 1

#include <gb/gb.h>
#include "include/dizzy_types.h"

const dialog_item const dylan_dialog        = {0,  0, "-HELLO, DIZZY!", J_B, &dylan_dialog1};
const dialog_item const dylan_dialog1       = {0,  1, "-HI, DYLAN!", J_B, &dylan_dialog2};
const dialog_item const dylan_dialog2       = {0,  2, "-I'VE LOST MY", 0, &dylan_dialog3};
const dialog_item const dylan_dialog3       = {1,  3, "ELEVATOR KEY...", J_B, &dylan_dialog4};
const dialog_item const dylan_dialog4       = {0,  4, "-OK, I'LL SEE", 0, &dylan_dialog5};
const dialog_item const dylan_dialog5       = {2,  5, "WHAT I CAN DO.", J_B, 0};

const dialog_item const dylan_thanks        = {0,  0, "-THANK YOU,", 0, &dylan_thanks1};
const dialog_item const dylan_thanks1       = {10, 1, "DIZZY!", J_B, &dylan_thanks2};
const dialog_item const dylan_thanks2       = {0,  2, "-NOT AT ALL,", 0, &dylan_thanks3};
const dialog_item const dylan_thanks3       = {10, 3, "DYLAN.", J_B, 0};

const dialog_item const troll_dialog        = {0,  0, "-EERGH!!", J_B, &troll_dialog1};
const dialog_item const troll_dialog1       = {0,  1, "-EXCUSE ME, SIR?", J_B, &troll_dialog2};
const dialog_item const troll_dialog2       = {0,  2, "-THRE CO'NS", 0, &troll_dialog3};
const dialog_item const troll_dialog3       = {8,  3, "TO PASS!", J_B, 0};

const dialog_item const troll_toll          = {0,  0, "-HERE YOU ARE,", 0, &troll_toll1};
const dialog_item const troll_toll1         = {10, 1, "SIR...", J_B, &troll_toll2};
const dialog_item const troll_toll2         = {0,  2, "-...", J_B, 0};

const dialog_item const game_over_dialog    = {0,  1, "G A M E  O V E R", 0, &game_over_dialog1};
const dialog_item const game_over_dialog1   = {2,  3, "PRESS  START", J_START, 0}; 

const dialog_item const start_dialog        = {3,  1, "DIZZY  AND", 0, &start_dialog1};
const dialog_item const start_dialog1       = {0,  2, "THE MUSHROOM PIE", 0, &start_dialog2};
const dialog_item const start_dialog2       = {2,  4, "PRESS  START", J_START, 0};

const dialog_item const too_much_items      = {0,  0, "YOU CAN CARRY", 0, &too_much_items1};
const dialog_item const too_much_items1     = {3,  1, "3 ITEMS ONLY!", J_B, 0};

const dialog_item const cleared_path        = {0,  0, "YOU HAVE CLEARED", 0, &cleared_path1};
const dialog_item const cleared_path1       = {3,  1, "THE PATH!", J_B, 0};

const dialog_item const intro               = {0,  0, "AS YOU ENTER THE", 0, &intro1};
const dialog_item const intro1              = {1,  1, "CAVE, YOU HEAR", 0, &intro2};
const dialog_item const intro2              = {0,  2, "HOW THE ENTRANCE", 0, &intro3};
const dialog_item const intro3              = {0,  3, "COLLAPSES BEHIND", 0, &intro4};
const dialog_item const intro4              = {5,  4, "YOU...", J_B, 0};

const dialog_item const coin_found          = {1,  0, "YOU HAVE FOUND", 0, &coin_found1};
const dialog_item const coin_found1         = {5,  1, "A COIN!", J_B, 0};
 
const dialog_item const daisy_dialog        = {0,  0, "-HAVE YOU GOT", 0, &daisy_dialog1};
const dialog_item const daisy_dialog1       = {1,  1, "MUSHROOMS FOR", 0, &daisy_dialog2}; 
const dialog_item const daisy_dialog2       = {1,  2, "THE PIE, DIZZY?", J_B, &daisy_dialog3};
const dialog_item const daisy_dialog3       = {0,  3, "-JUST A MOMENT,", 0, &daisy_dialog4};
const dialog_item const daisy_dialog4       = {10, 4, "DAISY!", J_B, 0};

const dialog_item const daisy_gives_pie     = {0,  0, "AN HOUR LATER...", J_B, &daisy_gives_pie1};
const dialog_item const daisy_gives_pie1    = {0,  2, "-TAKE THIS PIE", 0, &daisy_gives_pie2};
const dialog_item const daisy_gives_pie2    = {1,  3, "TO OUR GRANDPA,", 0, &daisy_gives_pie3};
const dialog_item const daisy_gives_pie3    = {10, 4, "DIZZY!", J_B, &daisy_gives_pie4};
const dialog_item const daisy_gives_pie4    = {0,  5, "-THANK YOU,", 0, &daisy_gives_pie5};
const dialog_item const daisy_gives_pie5    = {8,  6, "I'LL DO!", J_B, 0};

const dialog_item const firefly_out         = {0, 0, "YOU DROP THE JAR", 0, &firefly_out1};
const dialog_item const firefly_out1        = {0, 1, "IT OPENS,AND THE", 0, &firefly_out2};
const dialog_item const firefly_out2        = {1, 2, "FIREFLY BREAKS", 0, &firefly_out3};
const dialog_item const firefly_out3        = {5, 3, "FREE...", J_B, 0};

const dialog_item const firefly_caught      = {0, 0, "YOU HAVE  CAUGHT", 0, &firefly_caught1};
const dialog_item const firefly_caught1     = {3, 1, "A FIREFLY!", J_B, 0};

const dialog_item const darkness_warn       = {0, 0, "YOU ENTER A VERY", 0, &darkness_warn1};
const dialog_item const darkness_warn1      = {0, 1, "DARK  ROOM, EVIL", 0, &darkness_warn2};
const dialog_item const darkness_warn2      = {2, 2, "RED EYES ARE"    , 0, &darkness_warn3};
const dialog_item const darkness_warn3      = {0, 3, "SHINING AHEAD...", J_B, 0};

const dialog_item const grandpa_thanks      = {0,  0, "-THANK YOU,", 0, &grandpa_thanks1};
const dialog_item const grandpa_thanks1     = {10, 1, "DIZZY!", 0, &grandpa_thanks2};
const dialog_item const grandpa_thanks2     = {0,  3, "CONGRATULATIONS!", 0, &grandpa_thanks3};
const dialog_item const grandpa_thanks3     = {1,  4, "YOUR QUEST IS", 0, &grandpa_thanks4};
const dialog_item const grandpa_thanks4     = {3,  5, "COMPLETE!", J_B, 0};