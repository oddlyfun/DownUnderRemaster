draw_self();

var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

x = floor( _vw / 2 );
y = sprite_height;

if ( finished_loading == false )
{
	var _size = array_length(pre_load_array[main_index]);
	var _string = string(sub_index + 1) + " / " + string(_size);
	
	var _x = floor( (_vw / 2) - ( string_width(_string) / 2 ) );
	var _y = floor( (_vh / 2) - (string_height(_string) / 2 ) );

	write_text(_x, _y, c_white, _string, FONT);
} else
{
	var _string = "Finished";
	var _x = floor( (_vw / 2) - ( string_width(_string) / 2 ) );
	var _y = floor( (_vh / 2) - (string_height(_string) / 2 ) );
	write_text(_x, _y, c_white, _string, FONT);
}