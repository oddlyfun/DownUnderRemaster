function draw_basic_button(_x, _y, b_width, b_height, state, text)
{
	//spr_basic_button
	//sprite_get_nineslice(sprite_index)
	//	returns a struct
	//	enabled, left, top, right, bottom, tilemode <array>
	draw_set_font(fnt_game);
	//draw_set_color(c_black);

	var _spr_info = sprite_get_nineslice(spr_basic_button);
	var _text_x_off = _x + _spr_info.left;
	var _text_y_off = _y + _spr_info.top;
	
	// size of the 'middle' of the box
	var _height_mid = (((b_height -_spr_info.bottom) - _spr_info.top) / 2) - ( string_height(text) / 2 );
	var _width_mid = (((b_width -_spr_info.right) - _spr_info.left) / 2) - ( string_width(text) / 2 );
	
	draw_sprite_stretched(spr_basic_button, state, _x, _y, b_width, b_height);

	//draw_text(_text_x_off + _width_mid, _text_y_off + _height_mid, text);
	write_text(_text_x_off + _width_mid, _text_y_off + _height_mid,c_black,text)
}


function basic_button(_gx=0, _gy=0, _width=0, _height=0, _state=0, _text="") constructor
{
    gx = _gx;
    gy = _gy;
    width = _width;
    height = _height;
    state = _state;
    text = _text;
    hover = false;

    static draw_me = function()
    {
		draw_set_font(FONT);
		var _string_height = sprite_get_height(spr_font_small);
		var _string_width = string_width(text);

		var _spr_info = sprite_get_nineslice(spr_basic_button);
		var _text_x_off = gx + _spr_info.left;
		var _text_y_off = gy + _spr_info.top;
		
		// size of the 'middle' of the box
		var _height_mid = floor( (((height -_spr_info.bottom) - _spr_info.top) / 2) - ( _string_height / 2 ) );
		var _width_mid = floor ( (((width -_spr_info.right) - _spr_info.left) / 2) - ( _string_width / 2 ) );
		
		draw_sprite_stretched(spr_basic_button, state, gx, gy, width, height);

		//draw_text(_text_x_off + _width_mid, _text_y_off + _height_mid, text);
		write_text(_text_x_off + _width_mid, _text_y_off + _height_mid,c_black,text)
    }
	
	static check_hover = function()
	{
		state = 0;
		hover = gui_element_collision(x,y,width,height);
		if ( mouse_check_button(mb_left) and hover == true )
		{
			state = 1;
		}
	}
}




function top_title_menu() constructor
{
	top_items = ["Game","Settings","Help"];
	game_items = ["New","Continue","Exit"];
	settings_items = ["Sound","Graphics"];
	help_items = ["How to Play","Info"];
	toggle_item = false;
	BAR_BG = make_color_rgb(167,183,183);
	top_pick = "";
	item_pick = "";


	static draw_me = function()
	{
		//draw_rectangle_colour(x1, y1, x2, y2, col1, col2, col3, col4, outline);
		var _gui_w = display_get_gui_width();
		var _gui_h = display_get_gui_height();
		var _bar_h = 40;
		var _string_x = 10;
		draw_rectangle_color(0,0, _gui_w, _bar_h, BAR_BG, BAR_BG, BAR_BG, BAR_BG, false);

		// top level text
		top_pick = "";
		item_pick = ""; 
		for ( var i = 0; i < array_length(top_items); i++ )
		{
			var _header = top_items[@ i];
			var _string_h = string_height(_header);
			var _string_w = string_width(_header);
			var _string_y = (_bar_h / 2) - (_string_h / 2);

			var _hover = gui_element_collision(_string_x, _string_y, _string_w, _string_h);

			var _c = c_black;
			if (_hover)
			{
				_c = c_white;
				top_pick = _header;
			}

			write_text(_string_x, _string_y, _c, _header);

			_string_x = _string_x + _string_w + 10;
		}
	}
}
