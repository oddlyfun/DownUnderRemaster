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
		hover = gui_element_collision(gx,gy,width,height);
		if ( mouse_check_button(mb_left) and hover == true )
		{
			state = 1;
		}
	}
}


function scroll_bar(_x, _y, _item_list, _items_per_page) constructor
{
	x = _x;
	y = _y;
	width = 10;
	height = 10;
	item_list = _item_list;
	item_per_page = _items_per_page;
	item_index = 0;
	selected_index = 0;
	text_margin = 2;

	toggle_sprite = spr_basic_dropdown;
	toggle_data = {
		tx : 0,
		ty : 0,
		tw : sprite_get_height(spr_basic_dropdown),
		th : sprite_get_width(spr_basic_dropdown),
		tspr : spr_basic_dropdown
	};
	bulb_sprite = spr_drop_down_scroll;
	show_drop = false;



	init();


	static draw_me = function()
	{
		draw_display();
		var _size = array_length(item_list);

		if ( show_drop == true and _size > item_per_page )
		{
			draw_display();
		}
	}

	static draw_display = function()
	{
		draw_sprite_stretched(spr_white_dropdown, 0, x, y, width, toggle_data.th);
		draw_sprite(toggle_data.tspr,0, toggle_data.tx, toggle_data.ty);
		var _fish = item_list[@ selected_index];
		write_text(x,y, c_black, _fish.full_name);
	}

	static draw_drop = function ()
	{

	}

	static init = function()
	{
		var _w = 0;
		var _arl = array_length(item_list);

		for ( var i = 0; i < array_length(item_list); i++ )
		{
			var _string = item_list[@ i];
			var _len = string_width(_string);

			if ( _len > _w )
			{
				_w = _len;
			}
		}

		width = _w + ( text_margin * 2);
		height = _items_per_page * ( string_height("STRING") + (text_margin *_arl ) );
		toggle_data.tx = x + width;
		toggle_data.ty = y;

	}

}
