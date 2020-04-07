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