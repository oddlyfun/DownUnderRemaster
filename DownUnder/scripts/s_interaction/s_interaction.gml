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

    static draw_me = function ()
    {
		//draw_set_font(fnt_game);
		var _string_height = sprite_get_height(spr_font_small);
		var _string_width = sprite_get_width(spr_font_small);

		var _spr_info = sprite_get_nineslice(spr_basic_button);
		var _text_x_off = gx + _spr_info.left;
		var _text_y_off = gy + _spr_info.top;
		
		// size of the 'middle' of the box
		var _height_mid = (((height -_spr_info.bottom) - _spr_info.top) / 2) - ( _string_height / 2 );
		var _width_mid = (((b_width -_spr_info.right) - _spr_info.left) / 2) - ( _string_width / 2 );
		
		draw_sprite_stretched(spr_basic_button, state, gx, gy, width, height);

		//draw_text(_text_x_off + _width_mid, _text_y_off + _height_mid, text);
		write_text(_text_x_off + _width_mid, _text_y_off + _height_mid,c_black,text)
    }
}
