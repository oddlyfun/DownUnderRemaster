//var _inst = instance_nearest(0,0,o_player_fish);

var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _center_x = _camx + (view_width / 2 );
var _center_y = _camy + (view_height / 2 );



draw_set_color(c_white);

var _x_ = _center_x + pad_x
draw_line(_x_, 0, _x_, room_height);

_x_ = _center_x - pad_x
draw_line(_x_, 0, _x_, room_height);

var _y_ = _center_y - pad_y
draw_line(0, _y_, room_width, _y_);

_y_ = _center_y + pad_y
draw_line(0, _y_, room_width, _y_);