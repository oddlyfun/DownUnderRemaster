var _screen_width = window_get_width();
var _screen_height = window_get_height();

my_window.check_close_hover();
fs_checkbox.check_hover();

music_slider.check_hover();
sfx_slider.check_hover();

music_slider.clicked_on();
sfx_slider.clicked_on();

music_slider.adjust_amount();
sfx_slider.adjust_amount();

music_slider.lose_focus();
sfx_slider.lose_focus();

ok_btn.check_hover();

sb_reso.toggle_click_check();
sb_reso.bulb_click_checks();
sb_reso.move_bulb(mouse_y - prev_mouse_y);

if ( mouse_check_button_released(mb_left) )
{
	if ( my_window.hover_close == true )
	{
		room_goto(ro_start_screen);
	}

	if ( fs_checkbox.checked == true )
	{
		window_set_fullscreen(true);
	} else
	{
		window_set_fullscreen(false);
	}


	if ( ok_btn.hover == true )
	{
		global.MUSIC_GAIN = music_slider.amount;
		global.SFX_GAIN = sfx_slider.amount;
		global.RES_INDEX = sb_reso.selected_index;
		save_game_settings();
	}


	var _res_selected = sb_reso.item_list[@ sb_reso.selected_index];
	_res_selected = create_string_array(_res_selected);

	var _scroll_width = real( _res_selected[@ 0] );
	var _scroll_height = real( _res_selected[@ 2] );

	if ( _scroll_width != _screen_width or _scroll_height != _screen_height )
	{
		window_set_size(_scroll_width, _scroll_height);
	}

}


prev_mouse_y = mouse_y;