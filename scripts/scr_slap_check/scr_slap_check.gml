/// @function scr_slap_counter(_center_pile);
/// @param {ds_list} _center_pile: list of card values to be checked for slap conditions
/// @return {bool} slap_condition: whether or not a slap condition is present
function scr_slap_check(_center_pile)
{
	// return array top card at 0, middle card at 1, bottom card at 2
	var _top_three = get_top_cards(_center_pile);
	
	
	if (check_for_double(_top_three) || check_for_sandwich(_top_three))
	{
		return true;
	}
	else
	{
		return false;
	}
}


/// @function get_top_cards(_center_pile);
/// @param {ds_list} _center_pile: list representing the cards in center pile
/// @return {ds_list} top_card: a list containing the top 3 card values from _center_pile
function get_top_cards(_center_pile)
{
	var _center_count = ds_list_size(_center_pile);

	var _top_card;
	var _middle_card;
	var _bottom_card;

	// Check to see if the top card's index exists (pile has at least one card)
	if (scr_list_index_exists(_center_pile, _center_count - 1))
	{
		_top_card = scr_card_identifier(_center_pile[|_center_count - 1]);
	}
	else
	{
		_top_card = "x";
	}
	
	// Check to see if the middle card's index exists (pile has at least two cards)
	if (scr_list_index_exists(_center_pile, _center_count - 2))
	{
		_middle_card = scr_card_identifier(_center_pile[|_center_count - 2]);
	}
	else
	{
		_middle_card = "x";
	}

	// Check to see if the bottom card's index exists (pile has three or more cards)
	if (scr_list_index_exists(_center_pile, _center_count - 3))
	{
		_bottom_card = scr_card_identifier(_center_pile[|_center_count - 3]);
	}
	else
	{
		_bottom_card = "x";
	}
	
	show_debug_message("Top three card values are " + string(_center_pile[|_center_count - 1]) + " " + string(_center_pile[|_center_count - 2]) + " " + string(_center_pile[|_center_count - 3]));
	
	return [_top_card, _middle_card, _bottom_card];
}

///@function check_for_double(_card_array);
///@param {array} _card_array: an array of three card values
///@return {bool} slap_condition: whether or not a slap contition is present
function check_for_double(_card_array)
{
	if (_card_array[0] == _card_array[1])
	{
		return true;
	}
	else
	{
		return false;
	}
}


///@function check_for_sandwich(_card_array);
///@param {array} _card_array: an array of three card values
///@return {bool} slap_condition: whether or not a slap contition is present
function check_for_sandwich(_card_array)
{
	if (_card_array[0] == _card_array[2])
	{
		return true;
	}
	else
	{
		return false;
	}
}
