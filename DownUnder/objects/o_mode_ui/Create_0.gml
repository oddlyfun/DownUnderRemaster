draw_set_font(FONT);
fishy_list = [];
drop_list = [];
window_title = "";
drop_disabled = true;


switch ( global.GAME_MODE )
{
	case CHALLENGE:
		fishy_list = challenge_list();
		window_title = "Challenge";
	break;

	case GAUNTLET:
		fishy_list = fishy_gauntlet();
		window_title = "Gauntlet";
	break;

	case PRACTICE:
		fishy_list = fishy_practice();
		drop_disabled = false;
		window_title = "Practice";
	break;

	default:
		fishy_list = fishy_practice();
		window_title = "Default Value -- Something Went Wrong!?";
	break;
}

drop_list = fish_name_from_number_list(fishy_list);

ui_width = display_get_gui_width();
ui_height = display_get_gui_height();

//window_sprite_info = sprite_get_nineslice(spr_popup_X);

var window_width 	= floor(ui_width * 0.85);
var window_height 	= floor(ui_height * 0.85);
//window_x 			= (ui_width / 2) - (window_width / 2);
//window_y 			= (ui_height / 2) - (window_height / 2);

window_display 		= new window_popup(window_width, window_height, window_title);

window_midpoint 	= window_display.x + (window_display.width / 2);

panel_left_width 	= (window_display.width / 2) * 0.90;
panel_left_height 	= window_display.height * 0.90;
panel_left_x 		= window_display.x + ((window_display.width / 4 ) - (panel_left_width / 2));
panel_left_y 		= window_display.y + ((window_display.height / 2 ) - (panel_left_height / 2));
panel_left_anchors 	= anchor_grid(panel_left_width, panel_left_height, 10, 1,panel_left_x,panel_left_y);

panel_right_width 	= panel_left_width;
panel_right_height 	= panel_left_height;
panel_right_x 		= window_midpoint + ((window_width / 4 ) - (panel_left_width / 2));
panel_right_y 		= panel_left_y;
panel_right_anchors = anchor_grid(panel_right_width, panel_right_height, 10, 1,panel_right_x,panel_right_y);
panel_right_note_anchor = 4;
panel_right_note_bottom_anchor = 8;
panel_right_note_height = panel_right_anchors[0][8].y - panel_right_anchors[0][5].y

// magic number but all my fish have been set to 5 FPS
fish_display_rate = 5 / 60;
fish_image_index = 0;

fish_list_size = array_length(fishy_list);


items_per_page = 10;
if ( global.GAME_MODE == CHALLENGE or fish_list_size < 10 ) then items_per_page = fish_list_size;

fish_index = 0;
fish_selected = 0;

var _fish_info = fishy_list[@ fish_selected];
panel_right_note_text = new text_wrap(panel_right_width,panel_right_note_height,_fish_info.notes);
panel_right_note_text.create_pages();

window_text_height = string_height("STRING");

prev_mouse_y = mouse_y;

var btn_w = 100;
var btn_h = 25;
play_btn = new basic_button(0,0,btn_w,btn_h,0,"Play");
cancel_btn = new basic_button(0,0,btn_w,btn_h,0,"Cancel");

btn_array = [cancel_btn, play_btn];
btn_gap = 10;



// Adding new scroll bar * drop down menu
var _pos = panel_left_anchors[0][1];
drop_fishy = new scroll_bar(_pos.x, _pos.y, drop_list, items_per_page);
drop_fishy.width = panel_left_width - 20;
