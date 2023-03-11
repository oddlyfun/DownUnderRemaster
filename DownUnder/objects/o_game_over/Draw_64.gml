
//var _cam = view_camera[0];

var _bar_w = 150;
var _bar_h = 20;
var _view_w = display_get_gui_width()
var _view_h = display_get_gui_height()

var _x = (_view_w / 2) - (_bar_w / 2);
var _y = (_view_h / 2) - (_bar_h / 2);


var _b = c_black;
var _c = c_white;

draw_rectangle_color(_x-1, _y-1, _x + _bar_w+1, _y + _bar_h+1, _b, _b, _b, _b, false);
draw_rectangle_color(_x, _y, _x + _bar_w, _y + _bar_h, _c, _c, _c, _c, false);

var _sh = string_height("H");

var _text_x = floor(_x + 4);
var _text_y = floor(_y + (_sh / 2));

var _clicked = gui_element_collision(_x, _y, _bar_w, _bar_h);

if ( mouse_check_button_pressed(mb_left) and first_keypress == false )
{
	first_keypress = true;
	keyboard_string = "";
}


if ( string_length(keyboard_string) > 20 )
{
	var _str_len = string_length(keyboard_string);
	var _last = string_copy(keyboard_string,_str_len,1);
	keyboard_string = string_copy(keyboard_string,1,19) + _last;
}

write_text(_text_x, _text_y, c_black, keyboard_string);
var _len = string_width(keyboard_string);



draw_line_color( _text_x + _len, _text_y, _text_x + _len, _text_y + _sh, _b, _b );

click_ok.gx = _x + _bar_w - (click_ok.width );
click_ok.gy = _y + _bar_h + 4;

click_ok.draw_me();