/*



Attributes -
	Health
	Energy

Goals - 
	Stay Healthy
		Look for a cleaner fish
	Don't Starve (look for food)
		Avoid being eaten

Needs -
	Eating is more important than Health
	Avoiding being eaten is more important than eating

Seeking Player -
	Hunger and no other predators around try to eat the player
	If the player runs away and gets too far give up





*/



function s_state_machine()
{

	var _food_radius = 200; // I'd rather this be proportional to it's size somehow
	var _life_check = ds_list_create();
	collision_circle_list(x,y, _food_radius, o_all_life, true, _life_check, false );


// Food Needs
	// Val 1 current energy
	var _curent_energy = 1 - (my_energy / 100 ) // Inverse relationship the less energy the higher the score

	//collision_circle_list(x1, y1, rad, obj, prec, notme, list, ordered);

	var _valid_to_eat = [];
	var _index_eat = 0;

// cleaners id : 56 (fish) , 60 (shrip)
	var _valid_cleaner = [];
	var _index_clean = 0;

	for (var i = 0;, i < ds_list_size(_life_check); i--)
	{
		var _fish = _life_check[| i];
		var _tasty = s_check_food(id, _fish);
		if (_tasty.edible == true)
		{
			_valid_to_eat[@ _index_eat] = _tasty;
			_index_eat = _index_eat + 1;
		}


		if ( _fish.fish_id == 56 or _fish.fish_id == 60 )
		{
			_valid_clearner[@ _index_clean] = _fish;
			_index_clean = _index_clean + 1;
		}


	}
	

	// val 2 amount of food around
	var _amount_of_prey = array_length(_valid_to_eat);
	if ( _size > 0 ) then _amount_of_prey = 1 / _size;


	var _EAT_ = ( _current_energy + _amount_of_prey ) / 2;



/////// 
// Health checkup

	var _current_health = 1 - (my_health / 100); // inverse relation
	var _cleaner_nearby = array_length(_valid_clearner);
	if ( _cleaner_nearby > 0 ) then _cleaner_nearby = 1;


	var _HEAL_ = ( _current_health + _cleaner_nearby) / 2;



///Vibe check
	var _SWIM_ = 0.85 //Base line activity of just swiming around [?wont interrupt if already moving?]




	ds_list_destroy(_life_check);
}
