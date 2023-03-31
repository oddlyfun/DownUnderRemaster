var _cam = view_camera[0];
var _vx = camera_get_view_x(_cam);
var _vy = camera_get_view_y(_cam);
x = my_x + _vx;
y = my_y + _vy;

//if ( keyboard_check_pressed(vk_backspace) and first_keypress == false)
//{
	//first_keypress = true;
	//keyboard_string = "";
//}


click_ok.check_hover();

if ( mouse_check_button_released(mb_left) and click_ok.hover == true )
{
	//global.GAME_MODE = CHALLENGE;
	var _name = keyboard_string;
	add_reef_ruler(_name);
	
	if ( global.GAME_MODE != PRACTICE )
	{
		room_goto(ro_reef_rulers);
	} 
	else 
	{
		room_goto(ro_start_screen);
	}
}
