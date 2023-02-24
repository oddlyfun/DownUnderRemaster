/// @description Check for reajusting the GUI elements based on the view changing sizes
var _w = display_get_gui_width();
var _h = display_get_gui_height();

if ( ui_width != _w or ui_height != _h )
{
	ui_width = _w;
	ui_height = _h;
	window_display.update_gui_location(_w,_h);
}
