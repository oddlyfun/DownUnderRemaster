/*
		game_items = 		["New","Continue","Exit"];
		settings_items = 	["Sound","Graphics"];
		rulers_items = 		["Challenge", "Gauntlet"];
		help_items = 		["How to Play","Info"];
		
*/
		
function title_menu_choice(_option)
{
	switch _option
	{
		//*******************************************************************
		//			Game Options
		//*******************************************************************
		case "New":
			with ( o_game_mode_selector )
			{
				display_level = 1;
			}
		break;
		case "Continue":
		break;
		case "Exit":
		break;
		//*******************************************************************
		//			Settings
		//*******************************************************************
		case "Sound":
		break;
		case "Graphics":
		break;
		//*******************************************************************
		//			Reef Rulers
		//*******************************************************************
		case "Challenge":
		break;
		case "Gauntlet":
		break;
		//*******************************************************************
		//			Help
		//*******************************************************************
		case "How to Play":
		break;
		case "Info":
		break;
	}
}