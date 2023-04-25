display_level = 0;
//was_created = true;
clicked = false;

ui_width = display_get_gui_width();
ui_height = display_get_gui_height();

mode_selection_width = ui_width * 0.60;
mode_selection_height = ui_height * 0.60;

top_margin = 4;
top_white_space = 6;
right_margin = 8;

mode_select = 3; // default selection can be practice
number_of_modes = 4;
mode_text_array = [
"Challenge",
"Gauntlet",
"Create-A-Fish",
"Practice"
];

mode_text_info = [
"Let the computer pick four fish for you to play. Start as the smallest fish. Move up to a larger fish when you earn enough points.",
"Conqure the reef! Become each of the creatures available for play, from the smallest fish to the Great White Shark at the top of the food chain.",
"Create your own fish and try to survive for 5 minutes! Choose the color and give it a name! Use your points to buy extra features for your creation.",
"Choose the fish you want to become, explore the reef, and learn how to survive."
];

mode_window = new window_popup(mode_selection_width, mode_selection_height,"Choose a game mode",8,true);

cancel_button = new basic_button(0, 0, 100, 32, 0, "Cancel");
start_button = new basic_button(0, 0, 100, 32, 0, "Start");

btn_array = [cancel_button, start_button];
