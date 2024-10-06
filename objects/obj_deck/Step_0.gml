// -------------------------------------------------------------------------------------- Ending the game
if (ds_queue_size(p1_pile) == 0 || ds_queue_size(p2_pile) == 0)
{
	if (ds_queue_size(p1_pile) == 0)
	{
		draw_text(640, 640, "P2 wins!");
	}
	else
	{
		draw_text(640, 640, "P1 wins!");
	}
	
	draw_text(640, 680, "Press the space bar to play again")
	
	while (!keyboard_check(vk_space))
	{}
	
	game_restart();
}

// -------------------------------------------------------------------------------------- Playing Cards


// P1 turn
if (global.turn_indicator)
{
	if (keyboard_check_pressed(ord("D")))
	{
		// takes the top card of the player pile and puts it on the center pile
		var _top_card = ds_queue_dequeue(p1_pile);
		ds_list_add(center_pile, _top_card);
			
		// checks the value of the card	
		var _card_value = scr_card_identifier(_top_card);
		show_debug_message("The card value is " + string(_card_value) + " [" + string(_top_card) + "] ");		
		
		// if the card is an ace, jack, queen, or king, a force-play loop starts
		if (_card_value == 1 || _card_value >= 11)
		{
			force_play_loop = true;
			force_play_count = face_card_indentifier(_card_value)
			turn_change();
		}
		// If a force play is currently happening and the card played isn't a face card, the force_play_count decrements
		else if (force_play_loop && force_play_count > 0)
		{
			force_play_count -= 1;
			show_debug_message("Force play is at " + string(force_play_count));
		}
		else if (!force_play_loop)
		{
			turn_change();
		}
	}
}

// P2 turn
if (!global.turn_indicator)
{
	if (keyboard_check_pressed(vk_right))
	{
		var _top_card = ds_queue_dequeue(p2_pile);
		ds_list_add(center_pile, _top_card);
		
	
		var _card_value = scr_card_identifier(_top_card);
		show_debug_message("The card value is " + string(_card_value) + " [" + string(_top_card) + "] ");		
		
		if (_card_value == 1 || _card_value >= 11)
		{
			force_play_loop = true;
			force_play_count = face_card_indentifier(_card_value)
			turn_change();
		}
		else if (force_play_loop && force_play_count > 0)
		{
			force_play_count -= 1;
		}
		else if (!force_play_loop)
		{
			turn_change();
		}
	}
}

if (force_play_loop && force_play_count == 0)
{
	force_play_loop = false;
	force_play_count = 0;
	
	if (global.turn_indicator)
	{
		take_deck(center_pile, p2_pile);
	}
	else if (!global.turn_indicator)
	{	
		take_deck(center_pile, p1_pile);
	}
}


// -------------------------------------------------------------------------------------- Slap Time Variables
if (keyboard_check_pressed(ord("A")))
{
	p1_slap_time = current_time;
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
	//indicates that a slap check is happening so that the function doesn't run over and over
	slap_check_happening = true;
	
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

	

	var _slap_condition = scr_slap_check(center_pile);
	if (_slap_condition)
	{
		show_debug_message("Slap condition present");
		take_deck(center_pile, _first_slap_pile);
	}
	else if (!_slap_condition && alarm[0] = 0)
	{
		show_debug_message("Slap condition not present");
		var penalty_card = ds_queue_dequeue(_first_slap_pile);
		ds_list_insert(center_pile, 0, penalty_card);
	}
	
    // Delaying the reset of slap times until after the slap check completes fully
    alarm[0] = 5; // Set alarm to reset slap times after a brief delay
}


// In alarm[0], reset the slap times and flag
if (alarm[0] == 0 && slap_check_happening)
{
    p1_slap_time = -1;
    p2_slap_time = -1;
    slap_check_happening = false; // Reset flag after the check completes
    force_play_loop = false;
    force_play_count = 0;
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