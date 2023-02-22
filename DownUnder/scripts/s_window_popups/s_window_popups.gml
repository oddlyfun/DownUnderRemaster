function window_popup(_width, _height,_title_string="Hello",_vert_anchors_amount=2,does_close=true) constructor
{
	width = _width;
	height = _height;
	titlebar_sprite = spr_popup_titlebar_blank;
	body_sprite = spr_popup_body;
	x = 0;
	y = 0;
	my_title = _title_string;
	hover_close = false;
	//left_panel = noone;
	//right_panel = noone;

	//var _text_height = sprite_get_height(spr_font_small) + 2;
	//_vert_anchors_amount = floor( _height / _text_height );

	ac_points = anchor_grid(width,height,_vert_anchors_amount,2,0,0);
	can_close = does_close;
	
	if ( can_close == true )
	{
		titlebar_sprite = spr_popup_titlebar_close;
	}

	nineslice_title_info = sprite_get_nineslice(titlebar_sprite);
	nineslice_body_info = sprite_get_nineslice(body_sprite);

	update_gui_location();

	static update_gui_location = function (
			_gui_w=display_get_gui_width(),
			_gui_h=display_get_gui_height())
	{
		x = floor((_gui_w / 2) - (width / 2));
		y = floor((_gui_h / 2) - (height / 2));
	}

	static update_title = function(_title_string)
	{
		my_title = _title_string;
	}

	static draw_me = function ()
	{
		// draw the title bar
		var _tb_y = sprite_get_height(titlebar_sprite);

		//draw_sprite_stretched(sprite, subimg, x, y, w, h);
		//var _box_nineslice = sprite_get_nineslice(spr_box_0);

		if ( hover_close == true and can_close == true)
		{
			draw_sprite_stretched(titlebar_sprite,1,x, y - _tb_y, width,_tb_y);
		} else
		{
			draw_sprite_stretched(titlebar_sprite,0,x, y - _tb_y, width,_tb_y);
		}

		var _xoff = x + nineslice_title_info.left;
		var _yoff = y + nineslice_title_info.top;
		write_text(_xoff,_yoff,c_white,my_title);

		// draw the body
		draw_sprite_stretched(body_sprite,0,x, y,width, height);
	}

	static check_close_hover = function ()
	{
		var _tb_y = y - sprite_get_height(titlebar_sprite);
		var _tb_x = (x + width) - nineslice_title_info.right

		hover_close = gui_element_collision(_tb_x, _tb_y, nineslice_title_info.right, sprite_get_height(titlebar_sprite) );
	}

}
