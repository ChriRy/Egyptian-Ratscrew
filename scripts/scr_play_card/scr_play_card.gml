///@function scr_play_card(center_pile, player_pile)
///@param {ds_list} _center_pile: list representing cards in the center pile
///@param {ds_queue} _player_pile: list representing cards in a player's hand
function scr_play_card(_center_pile, _player_pile)
{
	// Takes top card from current player's pile and puts it on the center stack
	var _top_card = ds_queue_dequeue(_player_pile);
	ds_list_add(_center_pile, _top_card);
	
	
	// Checks to see if the card played is a face card, and if it is a force-play loop is started. 
	var _card_value = scr_card_identifier(_top_card);
	show_debug_message("The card value is " + string(_card_value) + " [" + string(_top_card) + "] ");
	
	turn_change();
}




///@function face_card_played(_card_value);
///@param {int} _card_value: a number representing a certain card in the deck
///@return {int} _force_play_count: the number of cards a player must play in response to a given face card. 
/// Also swaps the turn whenever a face card is played
function face_card_indentifier(_card_value)
{
	var _force_play_count;
	
	switch (_card_value)
	{
		// Ace, the other player must play 4 cards
		case 1:
			_force_play_count = 4;
			break;
		// Jack, the other player must play 1 card
		case 11:
			_force_play_count = 1;
			break;
		// Queen, the other player must play 2 cards
		case 12:
			_force_play_count = 2;
			break;
		// King, the other player must play 3 cards
		case 13:
			_force_play_count = 3;
			break;
		default:
			_force_play_count = 0;
			show_debug_message("Default case reached");
			break;
	}
	
	return _force_play_count;
}