window_display.draw_me();

var _fish_info = fishy_list[@ drop_fishy.selected_index];

draw_set_color(c_black);

var _anchor = panel_left_anchors[0][1]; // this is a vector (x,y)
var _scientific_name = "Scientific Name: \n" + _fish_info.scientific_name;
var _size_cm = "Length: " + _fish_info.avg_size_cm + " cm";
var _active_time = "Active: " + _fish_info.active;

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

	fish_image_index = fish_image_index + fish_display_rate
	var _fish_image_number = sprite_get_number(_sprite);
	if ( fish_image_index >= (_fish_image_number - 1) )
	{
		fish_image_index = 0;
	}
}

drop_fishy.draw_me();

//******************************************************************
//
// 							Right Panel
//
//******************************************************************

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

draw_text_anchor(panel_right_anchors[0][2], _special_abilty);
draw_text_anchor(panel_right_anchors[0][3], _depth_info);

_anchor = panel_right_anchors[0][5];

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
