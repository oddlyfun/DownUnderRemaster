draw_set_font(FONT);
fishy_list = [];
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




// using a DS list
//fish_list = global.playable_fish;

items_per_page = 10;
if ( global.GAME_MODE == CHALLENGE ) then items_per_page = 4;

fish_list_size = array_length(fishy_list);
fish_index = 0;
fish_selected = 0;

var _fish_info = fishy_list[@ fish_selected];
panel_right_note_text = new text_wrap(panel_right_width,panel_right_note_height,_fish_info.notes);
panel_right_note_text.create_pages();

toggle_struct = new basic_button(0,0,0,0,0,"");

window_text_height = string_height("STRING");

scroll_panel_text_margin = 2;
scroll_bar_panel_height = floor(window_text_height * items_per_page) + (scroll_panel_text_margin * items_per_page);
scroll_bar_toggle = false;

var _toggle_drop = spr_basic_dropdown;
var _tog_h = sprite_get_height(_toggle_drop);

sb_bulb_active = false;
sb_bulb_struct = new basic_button();
sb_bulb_size = floor( (scroll_bar_panel_height - (_tog_h * 2) ) * (items_per_page/fish_list_size) );
sb_bulb_scroll_amount = 0;

prev_mouse_y = mouse_y;

//window_title = "Practice";

var btn_w = 100;
var btn_h = 25;
play_btn = new basic_button(0,0,btn_w,btn_h,0,"Play");
cancel_btn = new basic_button(0,0,btn_w,btn_h,0,"Cancel");

btn_array = [cancel_btn, play_btn];
btn_gap = 10;



// Page Elements
//--Left Side--
//1. Drop Down fish selection
//2. Scientific Name:
//3. Length
//4. Active
//5. Image of the fish swiming back and forth
//--Right-Side--
//1. Smaller outline box
//2. Eats:
//3. Enemies:
//4. Special Ability:
//5. Long Description
//6. Below the outline box are the cancel and OK buttons
