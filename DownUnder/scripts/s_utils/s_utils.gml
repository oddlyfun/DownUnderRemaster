function draw_text_wrap(_x, _y, r_bound, _height, _words)
{
	//draw_set_color(c_black);
	draw_set_font(global.fnt_spr_small);

	var _top_buffer = 4;
	var _right_buffer = 4;

	_x = _x + _right_buffer;
	_y = _y + _top_buffer;
	//string_split(string, delimiter, [remove_empty], [max_splits]);
	// string split is not in the LTS
	var _word_array = create_string_array(_words); //string_split(_words, " "); // this is new I hope it works in the TTL
	

	var _size = array_length(_word_array);
	var _ini_x = _x;
	var _ini_y = _y;
	var _right_bound = r_bound; //_x + _width;

	for ( var i = 0; i < _size; i++ )
	{
		var _word = _word_array[@ i];
		var _word_len = string_width(_word);

		if ( _ini_x + _word_len >= _right_bound )
		{
			// the word if written would overflow
			_ini_x = _x;
			_ini_y = _ini_y + string_height(_word) + _top_buffer;
		}

		draw_text(_ini_x, _ini_y, _word);
		_ini_x = _ini_x + _word_len + string_width(" ");

	}

}



function create_string_array( _words )
{
	//string_length(str)
	//string_char_at(str,index)
	//string_copy(str, index, count);
	var _array = [];
	var _index = 0;
	
	var _count = 0;
	var _sub_string_start = 1;
	var _length = string_length(_words);
	var _a_word = "";
	// String index starts at 1
	//var _word = "";
	for ( var i = 1; i <= _length; i++ )
	{
		var _char = string_char_at(_words,i);
		if ( _char == " " )
		{
			_a_word = string_copy(_words, _sub_string_start, _count);
			_array[@ _index] = _a_word;
			_index = _index + 1;
			_sub_string_start = i + 1;
			_count = 0;
		} else
		{
			_count = _count + 1;
		}
	}
	
	
	_a_word = string_copy(_words, _sub_string_start, _count);
	_array[@ _index] = _a_word;
	
	
	return _array;
}


function anchor_grid(w,h,rows=2,cols=2,xoff=0,yoff=0)
{
	var _anchor_array = [0,0];

	var _block_w = w / cols;
	var _block_h = h / rows;

	for ( var i = 0; i <= cols; i++ )
	{
		for ( var j = 0; j <= rows; j++ )
		{
			var _x = (i * _block_w) + xoff;
			var _y = (j * _block_h) + yoff;
			var _vec = new vector2(_x,_y);
			_anchor_array[i][j] = _vec;
		}
	}

	return _anchor_array;
}

function vector2(_x, _y) constructor
{
	x = _x;
	y = _y;
}

function gui_element_collision(_guix, _guiy, _width, _height)
{
	var _cam = view_camera[0];

	var _vw = camera_get_view_width(_cam);
	var _vx = camera_get_view_x(_cam);

	var _vh = camera_get_view_height(_cam);
	var _vy = camera_get_view_y(_cam);

	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();

	// normalize where the mouse is within the view
	var _mx = mouse_x - _vx;
	var _my = mouse_y - _vy;

	var _mgx = _gui_w * (_mx / _vw);
	var _mgy = _gui_h * (_my / _vh);

	var _x1 = _guix;
	var _y1 = _guiy;
	var _x2 = _guix + _width;
	var _y2 = _guiy + _height;

	if ( _mgx >= _x1 and _mgx <= _x2 and _mgy >= _y1 and _mgy <= _y2)
	{
		return true;
	} 
	return false;
}

function draw_text_anchor(_anchor, _string)
{
	var _x = _anchor.x;
	var _y = _anchor.y;

	draw_text(_x,_y,_string);
}


function write_text(_x, _y, _color, _string, _font=global.fnt_spr_small)
{
	draw_set_color(_color);
	draw_set_font(_font);
	draw_text(_x,_y,_string);

}

function create_array_from_struct_element(_list, _element_name)
{
	var _new_list = [];
	
	for ( var i = 0; i < array_length(_list); i++)
	{
		var _struct = _list[@ i];
		if ( variable_struct_exists(_struct, _element_name) )
		{
			var _elem = variable_struct_get(_struct, _element_name);
			array_push(_new_list, _elem);
		}
	}
	
	return _new_list;
}




function fish_name_from_number_list(_list)
{
	var _new_list = [];
	
	for ( var i = 0; i < array_length(_list); i++)
	{
		var _id = string(_list[@ i]);

		if ( variable_struct_exists(global.all_life, _id) )
		{
			var _elem = variable_struct_get(global.all_life, _id);
			array_push(_new_list, _elem.full_name);
		}
	}
	
	return _new_list;
}

function _distance_between_two_points(x1, y1, x2, y2)
{
	var _xx = sqr( abs(x2 - x1) );
	var _yy = sqr( abs(y2 - y1) );
	return sqrt( _xx + _yy );
}

function sum_array_values(_array)
{
	var _sum = 0;

	for ( var a = 0; a < array_length(_array); a++ )
	{
		_sum = _sum + _array[@ a];
	}

	return _sum;
}

function timer_format(_time)
{


	var format_min = floor( _time / 60 );
	var format_sec = floor( _time );
	var format_sec = format_sec mod 60;

	if ( format_sec <= 9 ) {
	    format_sec = "0" + string(format_sec);
	} else {
	    format_sec = string(format_sec);
	}


	var _time_string = string(format_min) + " : " + format_sec;
	return _time_string;
}
