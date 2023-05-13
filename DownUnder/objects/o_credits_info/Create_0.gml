dev_lines = "Game Design & Coding by Oddlyfun Games LLC";

artist_lines = [
	"Background Art - @catherinehigh",
	"    Coral Reef - @porevaari",
	"     Fishy Art - @diconcilio",
	"   Sprite Work - @tedshaq"
];

music_lines = [
	"-Music-",
	"Otjanbird Pt. II by Spheria",
	"Sunset Landscape by Keys of Moon",
	"Away by Meydan",
	"Freezing but Warm by Meydan",
	"Please Wake Up by Meydan"
];


var _win_w = 560;
var _win_h = 300;


var _btn_w = 54;
var _btn_x = floor( (_win_w / 2) - (_btn_w / 2) );


credit_window = new window_popup(_win_w, _win_h, "Credit", 6, true);
credit_window.change_anchor_config(14,14,credit_window.x, credit_window.y);

close_btn = new basic_button(_btn_x, _win_h - 20, _btn_w, 20, 0, "Close");
