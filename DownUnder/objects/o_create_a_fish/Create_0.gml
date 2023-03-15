var _cam = view_camera[0];
var _vw = display_get_gui_width();
var _vh = display_get_gui_height();

my_win_w = floor(_vw * 0.85);
my_win_h = floor(_vh * 0.85);

my_window = new window_popup(my_win_w,my_win_h, "Create a Fish", 4, true); 
my_window.change_anchor_config(14,6);