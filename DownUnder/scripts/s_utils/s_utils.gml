
function draw_text_wrap(_x, _y, r_bound, _height, _words)
{
	draw_set_color(c_black);
	draw_set_font(fnt_game);

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

	// String index starts at 1
	//var _word = "";
	for ( var i = 1; i <= _length; i++ )
	{
		var _char = string_char_at(_words,i);
		if ( _char == " " )
		{
			var _a_word = string_copy(_words, _sub_string_start, _count);
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


function draw_basic_button(_x, _y, b_width, b_height, state, text)
{
	//spr_basic_button
	//sprite_get_nineslice(sprite_index)
	//	returns a struct
	//	enabled, left, top, right, bottom, tilemode <array>
	draw_set_font(fnt_game);
	draw_set_color(c_black);

	var _spr_info = sprite_get_nineslice(spr_basic_button);
	var _text_x_off = _x + _spr_info.left;
	var _text_y_off = _y + _spr_info.top;
	
	// size of the 'middle' of the box
	var _height_mid = (((b_height -_spr_info.bottom) - _spr_info.top) / 2) - ( string_height(text) / 2 );
	var _width_mid = (((b_width -_spr_info.right) - _spr_info.left) / 2) - ( string_width(text) / 2 );
	

	draw_sprite_stretched(spr_basic_button, state, _x, _y, b_width, b_height);

	draw_text(_text_x_off + _width_mid, _text_y_off + _height_mid, text);
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
}

function anchor_grid(w,h,rows=2,cols=2,xoff=0,yoff=0)
{
	var _anchor_array = [][];

	var _block_w = w / cols;
	var _block_h = h / rows;

	for ( var i = 0; i <= cols; i++ )
	{
		for ( var j = 0; j <= rows; j++ )
		{
			var _x = (i * _block_w) + xoff;
			var _y = (j * _block_h) + yoff
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

	if ( _mgx > _x1 and _mgx < _x2 and _mgy > _y1 and _mgy < _y2)
	{
		return true;
	} 
	return false;
}
