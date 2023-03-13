gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

my_title = "Fish Finished";
win_width = string_width(my_title) + 10;


win_window = new window_popup(win_width,40,my_title,2,false);

var _bw = floor( win_window.width / 2 );
var _bh = 20;



var _bx = win_window.x + (( win_window.width / 2 ) - ( _bw / 2));
var _by = win_window.y + (( win_window.height / 2) - (_bh / 2));

win_btn = new basic_button(_bx,_by,win_width/2, 20, 0, "Yay!"); 