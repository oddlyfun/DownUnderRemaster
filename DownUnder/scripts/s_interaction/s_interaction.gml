function draw_basic_button(_x, _y, b_width, b_height, state, text)
{
	draw_set_font(fnt_game);

	var _spr_info = sprite_get_nineslice(spr_basic_button);
	var _text_x_off = _x + _spr_info.left;
	var _text_y_off = _y + _spr_info.top;
	
	var _height_mid = (((b_height -_spr_info.bottom) - _spr_info.top) / 2) - ( string_height(text) / 2 );
	var _width_mid = (((b_width -_spr_info.right) - _spr_info.left) / 2) - ( string_width(text) / 2 );
	
	draw_sprite_stretched(spr_basic_button, state, _x, _y, b_width, b_height);

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


function input_bar(_x=0,_y=0,_start_string="") constructor
{
	x = _x;
	y = _y;
	string_value = _start_string;
	has_focus = false;
	width = 60;
	height = 10;

	static draw_me = function()
	{
		var w = c_white;
		if ( has_focus == true ) then w = c_gray;
		draw_rectangle(x, y, x + width, y + height, w,w,w,w, false);
		write_text(x, y, c_black, string_value);
	}

	static clicked_on = function()
	{
		if ( mouse_check_button_pressed(mb_left) )
		{
			var _check = gui_element_collision(x,y,width,height);
			if (_check == true)
			{
				has_focus = true;
				keyboard_string = string_value;
			} else
			{
				has_focus = false;
			}
		}
	}

	static typing_on_me = function()
	{
		if ( has_focus == true )
		{
			if ( string_length(keyboard_string) <= 16 )
			{
				string_value = keyboard_string;
			} else
			{
				keyboard_string = string_value;
			}
		}
	}

}




function scroll_bar(_x, _y, _item_list, _items_per_page) constructor
{
	draw_set_font(global.fnt_spr_small);
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
	mouse_hover_index = 0;

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

	width = _w + ( text_margin * 4);

	drop_panel.y = y + height;
	drop_panel.x = x;
	drop_panel.height = (_items_per_page *  text_height) + (text_margin * (_items_per_page + 1) );
	

	toggle.x = x + width;
	toggle.y = y;

	bulb.x = toggle.x;
	bulb.y = drop_panel.y;
	bulb.height = floor( (drop_panel.height / max_items) * item_per_page);

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
			draw_list();
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
		var _item = item_list[@ selected_index];
		write_text(x + text_margin,y + text_margin, c_black, _item);
	}

	static draw_list = function()
	{
		var _start_x = drop_panel.x + text_margin;
		var _start_y = drop_panel.y + text_margin;
		var _start_index = bulb.index;

		draw_sprite_stretched(spr_white_dropdown, 0, drop_panel.x, drop_panel.y, width, drop_panel.height);

		for ( var i = 0; i < item_per_page; i++ )
		{
			var _item = item_list[@ _start_index];
			
			
			var _hover = gui_element_collision(_start_x, _start_y, width, text_height);
			if ( _hover == true and bulb.clicked == false)
			{
				draw_sprite_stretched(spr_blue_highlight,0, _start_x, _start_y, width - text_margin, text_height);
				write_text(_start_x, _start_y, c_white, _item);
				
				if ( mouse_check_button_released(mb_left) )
				{
					selected_index = _start_index;
					toggle.state = false;
					bulb.state = false;
				}
				
				
			} else
			{
				write_text(_start_x, _start_y, c_black, _item);
			}
			
			
			_start_y = _start_y + text_height + text_margin;
			_start_index = _start_index + 1;
			if ( _start_index >= max_items ) then break;
		}
	}

	static draw_drop = function ()
	{
		draw_sprite_stretched(spr_white_dropdown,1, bulb.x, drop_panel.y, bulb.width, drop_panel.height);
		draw_sprite_stretched(bulb.my_sprite,0, bulb.x, bulb.y, bulb.width, bulb.height);	
	}

	static move_bulb = function (amount)
	{
		if ( bulb.clicked == true )
		{
			bulb.y = bulb.y + amount;
		}
		
		if ( bulb.state == true ) 
		{
			if ( mouse_wheel_up() )
			{
				bulb.y = bulb.y - 1;
			}
		
			if ( mouse_wheel_down() )
			{
				bulb.y = bulb.y + 1;
			}
		}
		
		bulb.y = clamp(bulb.y, drop_panel.y, (drop_panel.y + drop_panel.height) - bulb.height);
		bulb.index =  floor( max_items * ( (bulb.y - drop_panel.y ) / drop_panel.height ));
	}
	

	
	
	static toggle_click_check = function()
	{
		if ( mouse_check_button_released(mb_left) )
		{
			var _hover = gui_element_collision(toggle.x, toggle.y, toggle.width, toggle.height);
			if ( _hover == true )
			{
				if ( toggle.state == true ) 
				{
					toggle.state = false;
					bulb.state = false;
				} else
				{
					toggle.state = true;
					var _size = array_length(item_list);
					if ( _size > item_per_page ) then bulb.state = true;
				}
			}
		}
	}
	
	static bulb_click_checks = function()
	{
		if ( bulb.state == true )
		{
			if ( mouse_check_button_pressed(mb_left) )
			{
				var _hover = gui_element_collision(bulb.x, bulb.y, bulb.width, bulb.height);
				if ( _hover == true ) then bulb.clicked = true;
			}
		
			if ( mouse_check_button_released(mb_left) and bulb.clicked == true )
			{
				bulb.clicked = false;
			}
		}
	}


	static set_width = function(_amount)
	{
		width = _amount;
		toggle.x = x + width;
		bulb.x = toggle.x;
	}		
}
