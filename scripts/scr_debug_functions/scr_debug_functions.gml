///@function scr_print_pile_contents(pile);
///@param {ds_list} _pile: a list with values representing cards in a pile
function check_card_pile(_pile)
{
	var _size = ds_list_size(_pile) - 1;
	//ds_list_sort(_pile, true);
	
	show_debug_message("---");
	for (var i = 0; i < _size; i++)
	{
		show_debug_message(string(_pile[|i]));
	}
	show_debug_message("---");
}



/// @function check_card_values(_center_pile);
/// @param {ds_list} _center_pile: list representing the cards in center pile
function check_card_values(_center_pile)
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
	
	var _top_three = [_top_card, _middle_card, _bottom_card];
	
	show_debug_message("Top three card values are " + string(_center_pile[|_center_count - 1]) + " " + string(_center_pile[|_center_count - 2]) + " " + string(_center_pile[|_center_count - 3]));
	show_debug_message("Top three cards are " + string(_top_three[0]) + " " + string(_top_three[1]) + " " + string(_top_three[2]));
	
	
}