display_level = 0;
clicked = false;

ui_width = display_get_gui_width();
ui_height = display_get_gui_height();

mode_selection_width = ui_width * 0.60;
mode_selection_height = ui_height * 0.60;

top_margin = 4;
top_white_space = 6;
right_margin = 8;

mode_select = -1;
number_of_modes = 4;
mode_text_array = [
"Challenge",
"Gauntlet",
"Create-A-Fish",
"Practice"
];

mode_text_info = [
"A random selection of 4 fish to play as. Collect enough points to move on to the next fish. Survive long enough to win!",
"Survive. Play from smallest to largest.",
"Create your own fish to see if you can make one best suited for survival.",
"Choose a fish and test out the waters."
];
