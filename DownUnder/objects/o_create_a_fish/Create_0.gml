var _cam = view_camera[0];
var _vw = display_get_gui_width();
var _vh = display_get_gui_height();

my_win_w = floor(_vw * 0.85);
my_win_h = floor(_vh * 0.85);

my_window = new window_popup(my_win_w,my_win_h, "Create a Fish", 4, true); 
my_window.change_anchor_config(14,6);

col_empty = make_color_rgb(96,104,143);
col_block = make_color_rgb(104,247,72);
max_points = 1500;

// Attribs
attr_list = ["Agility", "Endurance", "Size"];
attr_agi_index = 0;
attr_end_index = 0;
attr_siz_index = 0;

attr_max_blocks = 10;
attr_block_w = 4;
attr_block_h = 6;

// Color Choice
color_list = [c_blue, c_green, c_purple, c_red, c_yellow];
color_index = 0;
color_block_size = 12;

fish_sprite = noone;
