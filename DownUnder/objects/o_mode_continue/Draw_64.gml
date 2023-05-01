window_display.draw_me();

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
var _fish_info = fishy_list[@ fish_selected];
var _fname = _fish_info.full_name;
draw_set_color(c_black);
draw_text(panel_left_x + 5, panel_left_y + 3, _fname);
// drop down toggle
draw_sprite(_toggle_drop, 0, _toggle_x, panel_left_y);
toggle_struct.gx = _toggle_x;
toggle_struct.gy = panel_left_y;
toggle_struct.width = _tog_w;
toggle_struct.height = _tog_h;

var _anchor = panel_left_anchors[0][1]; // this is a vector (x,y)
var _scientific_name = "Scientific Name: \n" + _fish_info.scientific_name;
var _size_cm = "Length: " + _fish_info.avg_size_cm + " cm";
var _active_time = "Active: " + _fish_info.active;

draw_set_color(c_black);

draw_text(_anchor.x,_anchor.y, _scientific_name);

_anchor = panel_left_anchors[0][2]; // this is a vector (x,y)
draw_text(_anchor.x,_anchor.y, _size_cm);

_anchor = panel_left_anchors[0][3]; // this is a vector (x,y)
draw_text(_anchor.x,_anchor.y, _active_time);

_anchor = panel_left_anchors[0][4]; // this is a vector (x,y)
var _anchor_image_bot = panel_left_anchors[0][9];

var _sprite = asset_get_index(_fish_info.sprite_name);

var _ocean_width = panel_left_width;
var _ocean_height = _anchor_image_bot.y - _anchor.y; 
draw_sprite_part(spr_BG_Game,0,0,0,_ocean_width,_ocean_height, _anchor.x, _anchor.y);

if ( sprite_exists(_sprite) )
{
	var _x_center = floor(_anchor.x + (panel_left_width / 2));
	var _y_center = floor(_anchor.y + ((_anchor_image_bot.y - _anchor.y) / 2));
	draw_sprite(_sprite,floor(fish_image_index),_x_center, _y_center);
// animate fish
	fish_image_index = fish_image_index + fish_display_rate
	var _fish_image_number = sprite_get_number(_sprite);
	if ( fish_image_index >= (_fish_image_number - 1) )
	{
		fish_image_index = 0;
	}
}


// toggle on
if ( scroll_bar_toggle == true )
{
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
	var _sb_display_w = panel_left_width - _tog_w;

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
	var _ini_y = _sb_display_y + scroll_panel_text_margin;
	var _ini_x = _sb_display_x + scroll_panel_text_margin;
	
	for ( var i = 0; i < items_per_page; i++ )
	{
		var _fishy = fishy_list[@ fish_index];
		var _name = _fishy.full_name;
		
		
		// highlight
		var _hover = gui_element_collision(
			_ini_x,
			_ini_y,
			_sb_display_w - scroll_panel_text_margin,
			window_text_height
			);
		if ( _hover == true )
		{
			draw_sprite_stretched(spr_blue_highlight,0, 
				_ini_x,
				_ini_y, 
				_sb_display_w - scroll_panel_text_margin,
				window_text_height
				);
			draw_set_color(c_white);
		}

		if ( drop_disabled == true )
		{
			draw_set_color(c_gray);
		} else if ( _hover == true ) {
			draw_set_color(c_white);
		} else
		{
			draw_set_color(c_black);
		}

		draw_text(_ini_x, _ini_y, _name);
		_ini_y = _ini_y + string_height(_name) + scroll_panel_text_margin;
		
		if ( mouse_check_button_pressed(mb_left) )
		{
			if ( _hover == true and drop_disabled == false )
			{
				fish_selected = fish_index;
				_fish_info = fishy_list[@ fish_selected];
				panel_right_note_text.set_text(_fish_info.notes);
				scroll_bar_toggle = false;
				break;
			} else if ( _hover == false )
			{
				//scroll_bar_toggle = false;
				//break;
			}
		}

		fish_index = fish_index + 1;
		if (fish_index >= fish_list_size ) then break;
	} // end list loop
	
}
/// Toggle Off



//******************************************************************
//
// 							Right Panel
//
//******************************************************************

// eats

var _eat_string = "Eats: " 			+ _fish_info.eats_desc
var _special_abilty = "Special: " 	+ _fish_info.ability
var _depth_info = "Depth Range: " 	+ _fish_info.depth_range_meters + " meters"
var _fun_notes = _fish_info.notes;

draw_set_color(c_black);
draw_set_font(FONT);

_anchor = panel_right_anchors[0][0];
draw_text_wrap(_anchor.x, _anchor.y, _anchor.x + panel_right_width, -1, _eat_string);

_anchor = panel_right_anchors[0][1];
var _preview = _fish_info.food_preview; // an array of IDs

var _food_x = _anchor.x;
var _food_y = _anchor.y - 8;
for ( var i = 0; i < array_length(_preview); i++ )
{
	var _food = _preview[@ i]; // a string
	_food = global.all_life[$ _food]; // struct
	var _pre_size = 24;
	var _food_sprite = asset_get_index(_food.sprite_name);
	var _c = c_black;
	draw_rectangle_colour(_food_x - 1, _food_y - 1, 
		_food_x + _pre_size + 1, _food_y + _pre_size + 1, 
		_c, _c, _c, _c, false);

	if ( sprite_exists(_food_sprite) )
	{
		var _sw = sprite_get_width(_food_sprite);
		var _sh = sprite_get_height(_food_sprite);

		var _left = sprite_get_width(_food_sprite) - _pre_size;
		var _top = floor ( (sprite_get_height(_food_sprite) / 2)  - (_pre_size / 2) );
		var _wid = _pre_size;
		var _hei = _pre_size;

		if ( _sw < _pre_size )
		{
			_left = 0;
			_wid = _sw;
		}

		if ( _sh < _pre_size ) 
		{
			 _top = 0; 
			 _hei = _sh;
		}

		draw_sprite_part(_food_sprite, 0, _left, _top, _wid, _hei, _food_x, _food_y);
	}

	_food_x = _food_x + _pre_size + 4;
}





//draw_text_anchor(panel_right_anchors[0][0], _eat_string);
draw_text_anchor(panel_right_anchors[0][2], _special_abilty);
draw_text_anchor(panel_right_anchors[0][3], _depth_info);

_anchor = panel_right_anchors[0][5];
//draw_text_wrap(_anchor.x, _anchor.y, _anchor.x + panel_right_width, -1, _fun_notes);

panel_right_note_text.x = _anchor.x;
panel_right_note_text.y = _anchor.y;
panel_right_note_text.write_out_pages();
panel_right_note_text.draw_page_buttons();



// Play and Cancel Buttons !!

_anchor = panel_right_anchors[0][9];

var _button_total_width = (play_btn.width * 2) + btn_gap;
var _first_button_x = _anchor.x + ((panel_right_width / 2) - (_button_total_width / 2));

cancel_btn.gx = _first_button_x;
cancel_btn.gy = _anchor.y;
play_btn.gy = _anchor.y;
play_btn.gx = _first_button_x + btn_gap + cancel_btn.width;

cancel_btn.draw_me();
play_btn.draw_me();
