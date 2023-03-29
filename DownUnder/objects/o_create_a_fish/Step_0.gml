my_window.check_close_hover();
ability_drop.toggle_click_check();

play_btn.check_hover();
close_btn.check_hover();

input_fish_name.clicked_on();
input_fish_name.typing_on_me();

if ( mouse_check_button_pressed(mb_left) )
{
	if ( my_window.hover_close == true  or close_btn.hover == true)
	{
		instance_create_layer(0,0,"Instances",o_game_mode_selector);
		instance_destroy(id);
	}

	if ( play_btn.hover == true )
	{
		global.player_fish_id = CAF_ID;
		CAF_STRUCT.sprite_name = "";
		CAF_STRUCT.is_custom = true; // new item
		// something about shaders
	}
}
