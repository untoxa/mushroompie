UBYTE grand_gets_pie(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
    if (id == ID_PIE) {
        if ((tile_y == 7) && (tile_x > 18) && (tile_x < 22)) {
            show_dialog_window(6, &grandpa_thanks);
            return ID_ITEM_USED;
        }
    }
    return default_drop(id);
}