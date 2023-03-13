function top_title_menu() constructor
{
	top_items = 		["Game","Settings",	"Reef Rulers","Help"];
		game_items = 		["New","Continue","Exit"];
		settings_items = 	["Sound","Graphics"];
		rulers_items = 		["Challenge", "Gauntlet","Create a Fish"];
		help_items = 		["How to Play","Info"];
	sub_items_list = 	[game_items, settings_items, rulers_items, help_items];

	toggle_item = false;
	toggle_index = 0;
	BAR_BG = make_color_rgb(167,183,183);
	top_pick = "";
	item_pick = "";


	static draw_me = function()
	{
		//draw_rectangle_colour(x1, y1, x2, y2, col1, col2, col3, col4, outline);
		var _gui_w = display_get_gui_width();
		var _gui_h = display_get_gui_height();
		var _bar_h = 18;
		var _string_x = 8;
		draw_rectangle_color(0,0, _gui_w, _bar_h+1, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0,0, _gui_w, _bar_h, BAR_BG, BAR_BG, BAR_BG, BAR_BG, false);
		
		

		// top level text
		//top_pick = "";
		//item_pick = "";
		var top_level_hover = false; 
		for ( var i = 0; i < array_length(top_items); i++ )
		{
			var _header = top_items[@ i];
			var _string_h = string_height(_header);
			var _string_w = string_width(_header);
			var _string_y = (_bar_h / 2) - (_string_h / 2);

			var _hover = gui_element_collision(_string_x, 0, _string_w, _bar_h);

			var _c = c_black;
			if (_hover)
			{
				_c = c_white;
				top_pick = _header;
				draw_sprite_stretched_ext(spr_overlay,0, _string_x, 0, _string_w, _bar_h, c_dkgray, 0.3);
			}
		
			write_text(_string_x, _string_y, _c, _header);


			if ( _hover == true )
			{
				top_level_hover = true;
				toggle_index = i;
			}


			if ( toggle_item == true and toggle_index == i ) 
			{
				var _sub = sub_items_list[@ toggle_index];
				var _sub_y = _bar_h;
				var _sub_x = _string_x;
				var _sub_rect_x = _sub_x;
				var _sub_rect_y = _sub_y + 1;
				var _sub_rect_height = _sub_rect_y + (string_height("TEST") * array_length(_sub)) + (array_length(_sub) * 2);

				var _blk = c_black;
				// Black outline?  
				draw_rectangle_color(_sub_rect_x, 		_sub_rect_y, _sub_rect_x + 100 + 1,	_sub_rect_height + 1, 		_blk, _blk, _blk, _blk, false);
				draw_rectangle_color(_sub_rect_x + 1, 	_sub_rect_y + 1, _sub_rect_x + 100,  _sub_rect_height, 	BAR_BG, BAR_BG, BAR_BG, BAR_BG, false);
//****************************************************************************************
//
//							Sub Items Displayed
//
//****************************************************************************************
				for ( var z = 0; z < array_length(_sub); z++ )
				{
					var _sub_text = _sub[@ z];
					
					var _sub_hover = gui_element_collision(_sub_x+2,_sub_y+2, 100, string_height("HEIGHT"));
					
					if ( _sub_hover == true )
					{
						write_text(_sub_x+2, _sub_y+2, c_white, _sub_text);
						item_pick = _sub_text;
					} else {
						write_text(_sub_x+2, _sub_y+2, _blk, _sub_text);
					}
					
			
					_sub_y = _sub_y + string_height("HEIGHT") + 2;
				}
				
				
				if ( mouse_check_button_released(mb_left) )
				{
					title_menu_choice(item_pick);
				}

			}



			_string_x = _string_x + _string_w + 10;
		}

		if ( mouse_check_button_released(mb_left) )
		{
			toggle_item = top_level_hover;
		}




	}
}
