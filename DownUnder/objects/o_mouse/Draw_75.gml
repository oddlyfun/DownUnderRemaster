var _disp_width = camera_get_view_width(view_camera[0]);
var _disp_height = camera_get_view_height(view_camera[0]);

var _disp_x = camera_get_view_x(view_camera[0]);
var _disp_y = camera_get_view_y(view_camera[0]);

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

	
var _gui_mx = floor( _gui_w * ((x - _disp_x)  / _disp_width ) );
var _gui_my = floor( _gui_h * ((y - _disp_y) / _disp_height ) );


draw_sprite(sprite_index,image_number-1, _gui_mx, _gui_my);