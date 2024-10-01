// -------------------------------------------------------------------------------------- P1 Controls

// P1 play card
if (global.turn_indicator && keyboard_check(ord("D")) && ds_queue_size(p1_pile) > 0)
{
	scr_play_card(center_pile, p1_pile);
}

if (keyboard_check_pressed(ord("A")))
{
	p1_slap_time = current_time;
}


// -------------------------------------------------------------------------------------- P2 Controls
if (!global.turn_indicator && keyboard_check(vk_right) && ds_queue_size(p2_pile) > 0)
{
	scr_play_card(center_pile, p2_pile);
}

if (keyboard_check_pressed(vk_left))
{
	p2_slap_time = current_time;
}


///@function slap_speed_check(_p1_slap_time, _p2_slap_time);
///@param {time} _p1_slap_time: the time when p1 pressed their slap button
///@param {time} _p2_slap_time: the time when p2 pressed their slap button
///@return {int} _winning_player: a number representing which player slapped first, or if it was a tie. 
function slap_speed_check(_p1_slap_time, _p2_slap_time)
{
	var _winning_player;
	

	if (_p2_slap_time < _p1_slap_time) 
	{
		_winning_player = 1;
	} 
	else if (_p1_slap_time < _p2_slap_time) 
	{
		_winning_player = 2;
	} 
	else 
	{
		_winning_player = 0;
	}
	
	show_debug_message("Winning player is " + string(_winning_player));
	return _winning_player;
	
}



// Slap button, P1 or P2. Only happens if there are actually cards in the center pile. 
if (ds_list_size(center_pile) > 0 && ((keyboard_check(vk_left)) || keyboard_check(ord("A"))))
{
	// Get the times from the variables representing who slapped when and put them in the slap_speed_check
	// function to see who slapped first. 
	var _first_slap = slap_speed_check(p1_slap_time, p2_slap_time);
	
	// The pile of the player who slapped first, starting as empty but then being set to one player or the other
	var _first_slap_pile;
	
	// P1 slapped first
	if (_first_slap == 1)
	{
		_first_slap_pile = p1_pile;
	}
	// P2 slapped first
	else if (_first_slap == 2)
	{
		_first_slap_pile = p2_pile;
	}
	// Times are equal or there is an error somewhere
	else
	{
		show_debug_message("Else statement reached in obj_card step event");
	}
	

	var _slap_condition = scr_slap_check(center_pile);
	if (_slap_condition)
	{
		show_debug_message("Slap condition present");
		take_deck(center_pile, _first_slap_pile);
	}
	else
	{
		show_debug_message("Slap condition not present");
	}
	
	// Reset times after checking
    p1_slap_time = -1;
    p2_slap_time = -1;
}


//debugging stuff
if (keyboard_check_pressed(vk_enter))
{
	check_card_pile(center_pile);
}
if (keyboard_check_pressed(vk_shift))
{
	check_card_values(center_pile);
}