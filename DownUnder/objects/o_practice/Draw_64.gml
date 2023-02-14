//spr_popup_X
//spr_radial_button
//draw_sprite_stretched(sprite, subimg, x, y, w, h);
draw_set_font(fnt_game);

draw_sprite_stretched(spr_popup_X, 0, window_x, window_y, window_width, window_height);

draw_set_color(c_white);
draw_text(window_x + 6, window_y, window_title);

// scroll bar parts

// -- Top Bar --

// -- Right Side drop down button

// -- Main Selection dropdown window

// -- Scroll bar
// --- Down Button
// --- Background grey
// --- Up button
// --- Scroll Bulb

var _toggle_drop = spr_basic_dropdown;
var _tog_h = sprite_get_height(_toggle_drop);
var _tog_w = sprite_get_width(_toggle_drop);
var _toggle_x = panel_left_x + panel_left_width - _tog_w;

var _sb_panel_height = scroll_bar_panel_height;
// selection area
draw_sprite_stretched(spr_white_dropdown, 0, panel_left_x, panel_left_y, panel_left_width - _tog_w, _tog_h );
// blue highlight * some work should be done before I want to use the highlight
//draw_sprite_stretched(spr_blue_highlight, 0, panel_left_x + 2, panel_left_y + 2, panel_left_width - _tog_w - 4, _tog_h - 4 );
// Text
var _fish_info = fish_list[| fish_selected];
var _fname = _fish_info.full_name;
draw_set_color(c_black);
draw_text(panel_left_x, panel_left_y, _fname);
// drop down toggle
draw_sprite(_toggle_drop, 0, _toggle_x, panel_left_y);
toggle_struct.gx = _toggle_x;
toggle_struct.gy = panel_left_y;
toggle_struct.width = _tog_w;
toggle_struct.height = _tog_h;

// toggle on
if ( scroll_bar_toggle == true ) {
	var _sb_top_y = panel_left_y + _tog_h;
	var _sb_top_x = _toggle_x;

	draw_sprite(spr_basic_dropdown,0,_sb_top_x, _sb_top_y);

	// the heigth of the bar should be equal to the text size * items per page
	var _sb_mid_height = _sb_panel_height - (_tog_h * 2);
	var _sb_mid_y = _sb_top_y + _tog_h;

	draw_sprite_stretched(spr_white_dropdown,1, _sb_top_x, _sb_mid_y, _tog_w, _sb_mid_height);

	var _sb_bot_y = _sb_mid_y + _sb_mid_height;

	draw_sprite(spr_basic_dropdown,1, _sb_top_x, _sb_bot_y);


	// display dropdown panel
	var _sb_display_y = _sb_top_y;
	var _sb_display_x = panel_left_x;
	var _sb_display_h = _sb_panel_height;

	draw_sprite_stretched(spr_white_dropdown, 0, _sb_display_x, _sb_display_y, panel_left_width - _tog_w, _sb_display_h);

	sb_bulb_struct.gx = _sb_top_x;
	sb_bulb_scroll_amount = clamp(sb_bulb_scroll_amount,0, _sb_mid_height - sb_bulb_size);
	sb_bulb_struct.gy = _sb_mid_y + sb_bulb_scroll_amount;
	
	sb_bulb_struct.width = _tog_w;
	sb_bulb_struct.height = sb_bulb_size;
	
	draw_sprite_stretched(spr_drop_down_scroll,0, 
		sb_bulb_struct.gx,
		sb_bulb_struct.gy,
		sb_bulb_struct.width,
		sb_bulb_struct.height );
		
		
	// text list
	fish_index = floor( fish_list_size * ( (sb_bulb_struct.gy - _sb_mid_y ) / _sb_mid_height ));
	var _ini_y = _sb_display_y;
	
	for ( var i = 0; i < items_per_page; i++ )
	{
		var _fishy = fish_list[| fish_index];
		
		var _name = _fishy.full_name;
		draw_set_color(c_black);
		draw_text(_sb_display_x, _ini_y, _name);
		_ini_y = _ini_y + string_height(_name);
		
		
		fish_index = fish_index + 1;
		if (fish_index >= fish_list_size ) then break;
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
}
/// Toggle Off
