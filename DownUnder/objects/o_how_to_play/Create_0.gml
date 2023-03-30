my_window = new window_popup(500,300, "How to Play");
my_window.change_anchor_config(10,12,my_window.x, my_window.y);


var _bx = my_window.x + (my_window.width / 2);
var _by = my_window.y + (my_window.height) - 40;

okay_btn = new basic_button(_bx, _by, 60, 20, 0, "OK");


header_text = "Explore the Reef:";

parag_01 = "Using the mouse will move the cursor around and your fish will follow. In the bottom left of the screen will show you the name of the things you hover over with the cursor. Try to remember what your fish will eat and select the correct item. Watch out not everyone is friendly beneath the waves.";

parag_02 = "If you have a special ability you can use the SPACEBAR to use it. However you will run out of energy faster the longer you use it.";

parag_03 = "Two things to watch out for is your Energy and Health bars. If either of them are empty you lose the game. Eating will recover Energy and finding a cleaner fish will restore your health.";


wrapper_01 = new text_wrap(420,200, parag_01);
wrapper_02 = new text_wrap(420,200, parag_02);
wrapper_03 = new text_wrap(420,200, parag_03);

wrapper_01.create_pages();
wrapper_02.create_pages();
wrapper_03.create_pages();
