// Play a card, P1 turn 
if (global.turn_indicator && keyboard_check(ord("D")) && ds_queue_size(p1_pile) > 0)
{
	scr_play_card(center_pile, p1_pile);
}
		
// Play a card, P2 turn
if (!global.turn_indicator && keyboard_check(vk_right) && ds_queue_size(p2_pile) > 0)
{
	scr_play_card(center_pile, p2_pile);
}

// Slap button, P1 or P2. Only happens if there are actually cards in the center pile. 
if (ds_list_size(center_pile) > 0 && ((keyboard_check(vk_left)) || keyboard_check(ord("A"))))
{
	var _slap_condition = scr_slap_check(center_pile);
	if (_slap_condition)
	{
		show_debug_message("Slap condition present");
	}
	else
	{
		show_debug_message("Slap condition not present");
	}
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