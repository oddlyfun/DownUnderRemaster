if ( mouse_check_button_pressed(mb_left) )
{
	// show the display
	if ( display_level == 0 )
	{
		display_level = 1;
		clicked = true;
	}

}



//*********************************************************************
//
//			Display Level 1: Game Mode Selection
//
//*********************************************************************



for ( var i = 0; i < array_length(btn_array); i++)
{
	var _btn = btn_array[@ i];
	_btn.hover = false;
	_btn.state = 0;
	var _hover_chk = gui_element_collision(_btn.gx, _btn.gy, _btn.width, _btn.height);
	if ( _hover_chk == true )
	{
		_btn.hover = true;
	}
}

// Held down
if ( mouse_check_button(mb_left) )
{
	for ( var i = 0; i < array_length(btn_array); i++)
	{
		var _b = btn_array[@ i];
		if ( _b.hover == true ) then _b.state = 1;
	}
}

// actually clicked
if ( mouse_check_button_released(mb_left) )
{
	for ( var i = 0; i < array_length(btn_array); i++)
	{
		var _b = btn_array[@ i];
		if ( _b.hover == true )
		{
			if (i == 0) then display_level = 0;
			// Start Button
			if (i == 1)
			{
				switch ( mode_select )
				{
					case: 0 // Challenge
					break;
					case: 1 // Gauntlet
					break;
					case: 2 // Create-a-Fish
					break;
					case: 3 // practice
						instance_create_layer(0,0,"Instances",o_practice);
						instance_destroy(id);
					break;
				}
			}
		}
	}
}
