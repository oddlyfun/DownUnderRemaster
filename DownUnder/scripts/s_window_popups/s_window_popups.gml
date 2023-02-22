// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_window_popup(_width, _height, does_close=true) constructor
{
	width = _width;
	height = _height;
	titlebar_sprite = spr_popup_titlebar_blank;
	body_sprite = spr_popup_body;
	
	can_close = does_close;
	
	if ( can_close == true )
	{
		titlebar_sprite = spr_popup_titlebar_close;
	}
}