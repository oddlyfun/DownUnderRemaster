function add_message(the_message, the_type)
{
	var message_struct =
	{
		msg : the_message,
		typ : the_type
	};
	
	ds_queue_enqueue(global.message_q, message_struct );
}

function draw_a_message(_x, _y, _struct, _alpha, _width, _height)
{
	draw_set_font(FONT);
	
	//draw_sprite_stretched_ext(spr_popup,0, _x, _y, _width, _height, c_white, _alpha);
	
	var _msg = _struct.msg;
	var _typ = _struct.typ;
	
	
	draw_set_alpha(_alpha);
		draw_set_color(c_white);
		var _xx = _x + 4;
		var _yy = _y + 4;
		var _sh = string_height(_msg);
		
		draw_text_transformed(_xx, _yy, _typ, 1, 1, 0);
		draw_text(_xx + 6, _yy + _sh, _msg);
	draw_set_alpha(1);
}