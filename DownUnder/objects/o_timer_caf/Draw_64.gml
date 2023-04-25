var _w = display_get_gui_width();

var _tsw = string_width(time_string);

var _x = _w - _tsw - 10;

var _y = floor ( string_height(time_string) / 2 ); 


write_text(_x+1, _y+1, c_black , time_string);
write_text(_x, _y, c_aqua, time_string);
