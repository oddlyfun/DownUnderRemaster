dev_lines = [
	"Game Design & Coding by Oddlyfun Games LLC"
];

artist_lines = [
	"Background Art - @catherinehigh",
	"    Coral Reef - @porevaari",
	"     Fishy Art - @diconcilio",
	"   Sprite Work - @tedshaq"
];

music_lines = [
	"Otjanbird Pt. II by Spheria",
	"Sunset Landscape by Keys of Moon",
	"Away by Meydan",
	"Freezing but Warm by Meydan",
	"Please Wake Up by Meydan"
];


var _win_w = 600;
var _win_h = 340;


var _btn_w = 40;
var _btn_x = floor( (_win_w / 2) - (_btn_w / 2) );


credit_window = new window_popup(_win_w, _win_h, "Credit", 6, true);

close_btn = new basic_button(_btn_x, _win_h - 20, _btn_w, 20, 0, "Close");
