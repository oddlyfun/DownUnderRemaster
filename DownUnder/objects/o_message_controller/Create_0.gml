draw_set_font(FONT);
draw_set_color(c_white);

alpha_list = ds_list_create();
message_list = ds_list_create();

ALPHA_DECAY = 1 / (global.GAME_FPS * 3);