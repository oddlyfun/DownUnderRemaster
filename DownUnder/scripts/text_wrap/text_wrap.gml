
function text_wrap(_width, _height, _text) constructor
{
	var _check_text = typeof(_text);
	text = "";
	if (_check_text == "string" )
	{
		text = create_string_array(_text);
	} else if ( _check_text != "array" )
	{
		text = "text was not sent as a string or an array of strings";
	}
	
	
	width = _width;
	height = _height;
	//font = global.fnt_spr_small;
	//page_button_sprite = spr_page_button;
	x = 0;
	y = 0;
	pages = [];//create_pages();
	page_number = 0;
	
	static create_pages = function()
	{
		var _size = array_length(text);
		var _ini_x = 0;
		var _ini_y = 0;
		var _right_bound = width; //_x + _width;
		
		var _page_index = 0;
		var _word_index = 0;
		var _line_index = 0;
		var _line_array = [];
		var _page_array = []
		var _words_array = [];

		for ( var i = 0; i < _size; i++ )
		{
			var _word = text[@ i];
			var _word_len = string_width(_word);

			if ( _ini_x + _word_len >= _right_bound )
			{
				// the word if written would overflow
				_line_array[@ _line_index] = _words_array;
				_line_index = _line_index + 1;
				_words_array = [];
				_word_index = 0;
				
				_ini_x = 0;
				_ini_y = _ini_y + string_height(_word);
				
				// check bottom
				if ( _ini_y >= height )
				{
					_page_array[@ _page_index] = _line_array;
					_page_index = _page_index + 1;
					_line_index = 0;
					_line_array = [];
					_ini_y = 0;
				}
			}
			
			_words_array[@ _word_index] = _word;
			_word_index = _word_index + 1;

			_ini_x = _ini_x + _word_len + string_width(" ");
		}
		
		_line_array[@ _line_index] = _words_array;
		_page_array[@ _page_index] = _line_array;
		
		pages = _page_array;
	}
		
	static write_out_pages =  function()
	{
		var _y = y;
		var _x = x;
		
		var _lines_array = pages[@ page_number]; // a bunch of arrays
		if ( array_length(pages) > 0 )
		{
			for ( var i = 0; i < array_length(_lines_array); i++ )
			{
				var _lines = _lines_array[@ i]; // finally be the word array for that line
				for ( var z = 0; z < array_length(_lines); z++ )
				{
					var _word = _lines[@ z];
					write_text(_x, _y, c_black, _word);
					_x = _x + string_width(_word) + string_width(" ");
				}
				_y = _y + string_height(_word);
				_x = x;
			}
		}
	}
	
	static set_text =  function(_string)
	{
		text = create_string_array(_string);
		create_pages();
	}
	
	static draw_page_buttons = function()
	{
		if ( array_length(pages) > 1 ) 
		{
			var _btn_height = sprite_get_height(spr_page_button);
			var _btn_width = sprite_get_width(spr_page_button);
			var _x = x;
			var _y = y - _btn_height;
			
			var _hover_left = gui_element_collision(_x, _y, _btn_width, _btn_height);
			

			// < 
			if ( _hover_left == false )
			{
				draw_sprite(spr_page_button,0,_x,_y);
			} else
			{
				draw_sprite(spr_page_button,1,_x,_y);
			}
			// Page Number
			_x = _x + _btn_width + 2;
			write_text(_x + 2, _y + 2, c_black, string(page_number + 1));
			_x = _x + _btn_width + 2;
			// >
			var _hover_right = gui_element_collision(_x, _y, _btn_width, _btn_height);
			if ( _hover_right == false )
			{
				draw_sprite(spr_page_button,2,_x,_y);
			} else
			{
				draw_sprite(spr_page_button,3,_x,_y);
			}
			
			if ( mouse_check_button_released(mb_left) ) 
			{
				if ( _hover_right == true ) then page_number = page_number + 1;
				if ( _hover_left == true ) then	page_number = page_number - 1;
				page_number = clamp(page_number, 0, array_length(pages)-1);
			}
			
			
			
		}
	}
	
}