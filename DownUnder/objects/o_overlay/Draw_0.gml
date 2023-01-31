var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_width(view_camera[0]);

x = _x;
y = _y;
image_xscale = _w;
image_yscale = _h;
image_alpha = 0.0;


draw_self();