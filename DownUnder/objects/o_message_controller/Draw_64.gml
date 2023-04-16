var _near = instance_nearest(x,y, o_gui)

if ( _near != noone )
{
	// I don't want messages to overlap the bottom bar
	var _above_bot_bar =  display_get_gui_height() - _near.BAR_SIZE 
	
	var _size = ds_list_size(message_list);
	var _h = 25;
	var _w = 160;
	
	var _start_y = _above_bot_bar - _h;
	var _start_x = 10;
	
	for ( var i = _size - 1; i >= 0; i-- )
	{
		var _alpha = alpha_list[| i]; // number 1 - 0
		var _msg = message_list[| i]; // struct
		
		draw_a_message(_start_x, _start_y, _msg, _alpha, _w, _h);
		
		_start_y = _start_y - _h;
	}
	
}