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
	width = 50;
	height = sprite_get_height(spr_basic_dropdown);
	item_list = _item_list;
	max_items = array_length(_item_list);
	item_per_page = _items_per_page;

	selected_index = 0;
	text_margin = 2;
	text_height = string_height("Height");

//***********************************
// 		Struct Parts
//***********************************
	toggle = {
		x : 0,
		y : 0,
		width : sprite_get_height(spr_basic_dropdown),
		height : sprite_get_width(spr_basic_dropdown),
		my_sprite : spr_basic_dropdown,
		state : false,
		hover : false
	};

	drop_panel = {
		x : 0,
		y : 0,
		height : 0,
		hover : false
	}

	bulb = {
		x : 0,
		y : 0,
		my_sprite : spr_drop_down_scroll,
		width : sprite_get_width(spr_drop_down_scroll),
		height : 10,
		index : 0,
		state : false,
		hover : false,
		clicked : false
	};


//***********************************
// 		Initzialize Information
//***********************************
	var _w = 0;
	var _arl = array_length(item_list);
	// Setting the width
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

	drop_panel.y = y + height;
	drop_panel.x = x;
	drop_panel.height = _items_per_page * ( string_height("STRING") + (text_margin *_arl ) );

	toggle.x = x + width;
	toggle.y = y;

	bulb.x = toggle.x;
	bulb.y = drop_panel.y;
	bulb.height = floor( drop_panel.height / item_per_page);

	var _size = array_length(item_list);
	if ( _size > item_per_page ) then bulb.state = true;

//*******************************
// 		Static Functions
//*******************************
	static draw_me = function()
	{
		draw_display();

		if ( toggle.state == true )
		{
			draw_drop();
			if ( bulb.state == true )
			{
				draw_drop();
			}	
		}
	}

	static draw_display = function()
	{
		draw_sprite_stretched(spr_white_dropdown, 0, x, y, width, height);
		draw_sprite(toggle.my_sprite,0, toggle.x, toggle.y);
		var _fish = item_list[@ selected_index];
		write_text(x,y + 2, c_black, _fish.full_name);
	}

	static draw_list = function()
	{
		var _start_x = drop_panel.x + text_margin;
		var _start_y = drop_panel.y + text_margin;
		var _start_index = bulb.index;

		draw_sprite_stretched(spr_white_dropdown, 0, drop_panel.x, drop_panel.y, width, drop_panel.height);

		for ( var i = 0; i < item_per_page; i++ )
		{
			var _fish = item_list[@ _start_index];
			// code for hovering
			write_text(_start_x, _start_y, c_black, _fish.full_name);
			_start_y = _start_y + text_height + text_margin;

			_start_index = _start_index + 1;
			if ( _start_index >= max_items ) then break;
		}
	}

	static draw_drop = function ()
	{
		draw_sprite_stretched(bulb.my_sprite,0, bulb.x, bulb.y, bulb.width, bulb.height);
	}

	static move_bulb = function (amount)
	{
		if ( bulb.clicked == true )
		{
			bulb.y = bulb.y + amount;
			bulb.y = clamp(bulb.y, drop_panel.y, (drop_panel.y + drop_panel.height) - bulb.height);
		}
	}
}
