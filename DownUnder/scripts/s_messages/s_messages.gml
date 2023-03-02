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
	
	
	//draw_sprite_ext(spr_popup,0, _x, _y, 1, 1, 0, c_white, _alpha);
	draw_sprite_stretched_ext(spr_popup,0, _x, _y, _width, _height, c_white, _alpha);

//	draw_text(header_x,header_y, "Click");
	var _msg = _struct.msg;
	var _typ = _struct.typ;
	
	var _begin_msg_y = 20 + _y;
	var _begin_msg_x = 4 + _x;
	
	draw_set_alpha(_alpha);
		draw_set_color(c_white);
		draw_text(_x + 4, _y + 4, _typ);
		draw_set_color(c_black);
		draw_text(_begin_msg_x + 4, _begin_msg_y + 2, _msg);
	draw_set_alpha(1);
}