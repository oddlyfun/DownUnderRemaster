

var _w = ( window_get_width() );
var _h = ( window_get_height() );

window_width = _w;
window_height = _h;

if ( window_height == 0 or window_width == 0 ) exit;

var _width_scale = floor( window_width / view_width );
var _height_scale = floor( window_height / view_height);

var _smallest_diff_w = 0;
var _smallest_diff_h = 0;

if ( _width_scale == _height_scale )
{
	_smallest_diff_w = (window_width / _width_scale) - view_width;
	_smallest_diff_h = (window_height / _height_scale) - view_height;
} else if ( _width_scale > _height_scale )
{
	_smallest_diff_w = (window_width / _width_scale) - view_width;
	_smallest_diff_h = (window_height / _width_scale) - view_height;
} else
{
	_smallest_diff_w = (window_width / _height_scale) - view_width;
	_smallest_diff_h = (window_height / _height_scale) - view_height;
}



var _end_width = view_width + _smallest_diff_w;
var _end_height = view_height + _smallest_diff_h;

camera_set_view_size(view_camera[0], _end_width, _end_height);
surface_resize(application_surface, _end_width, _end_height);

display_set_gui_size(_end_width, _end_height);

//show_debug_message(_end_width);
//show_debug_message(_end_height);

