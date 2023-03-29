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

	//update_gui_location();
	var _gui_w=display_get_gui_width();
	var _gui_h=display_get_gui_height();
	x = floor((_gui_w / 2) - (width / 2));
	y = floor((_gui_h / 2) - (height / 2));

	static update_gui_location = function (
			_gui_w=display_get_gui_width(),
			_gui_h=display_get_gui_height())
	{
		x = floor((_gui_w / 2) - (width / 2));
		y = floor((_gui_h / 2) - (height / 2));
	}
	
	
	static change_anchor_config = function (_num_x, _num_y, _xoff=0, _yoff=0)
	{
		ac_points = anchor_grid(width,height,_num_x,_num_y, _xoff, _yoff);
	}
	
	static update_view_location = function ()
	{
		var _vx = camera_get_view_x(view_camera[0]);
		var _vy = camera_get_view_y(view_camera[0]);
		var _vw = camera_get_view_width(view_camera[0]);
		var _vh = camera_get_view_height(view_camera[0]);
		
		x = _vx + floor((_vw / 2) - (width / 2));
		y = _vy + floor((_vh / 2) - (height / 2));
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

		var _xoff = floor(x) + nineslice_title_info.left;
		var _yoff = floor((y - _tb_y)) + nineslice_title_info.top;
		write_text(_xoff + 5,_yoff + 2,c_white,my_title);

		// draw the body
		draw_sprite_stretched(body_sprite,0,x, y,width, height);
	}

	static check_close_hover = function ()
	{
		var _tb_y = y - sprite_get_height(titlebar_sprite);
		var _tb_x = (x + width) - nineslice_title_info.right

		hover_close = gui_element_collision(_tb_x, _tb_y, nineslice_title_info.right, sprite_get_height(titlebar_sprite) );
	}
	
	static draw_ac_points = function ()
	{
		for( var i = 0; i < array_length(ac_points); i++ )
		{
			var _ypoints = ac_points[@ i];
			for ( var j = 0; j < array_length(_ypoints); j++ )
			{
				var _pos = ac_points[@ i,j];
				
				draw_circle_color(_pos.x, _pos.y, 2, c_green, c_green, false);
			}
		}
	}

}
