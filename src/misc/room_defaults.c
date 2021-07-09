void place_room_items(const UBYTE row, const UBYTE col, unsigned char * room_buf);

void default_draw() {
    // decompress tiles and collision map
    rle_decompress_data(current_room->room_map->rle_data, (UWORD)current_room->room_map->size, coll_buf);
    place_room_items(current_room_y, current_room_x, coll_buf);
    // draw background
    set_bkg_tiles(0, 3, room_width, room_height, coll_buf);
}

UBYTE default_drop(UBYTE id) {
    game_item * temp_item;
    if (id == ID_FIREFLY) {
        show_dialog_window(4, &firefly_out);

        temp_item = pop_by_id(&item_stack, ID_JAR);
        if (temp_item) push_last(&inventory_item_list, temp_item);
                
        return ID_LID;
    } 
    return ID_ITEM_NONE;
}