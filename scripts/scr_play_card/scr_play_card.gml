///@function take_deck(_center_pile, _player_pile);
///@param {ds_list} _center_pile: list representing cards in the center pile
///@param {ds_queue} _player_pile: list representing cards in a player's hand
function take_deck(_center_pile, _player_pile)
{
	// Gets the number of cards currently in the center pile
	var _center_pile_size = ds_list_size(_center_pile);
	
	for (i = 0; i < _center_pile_size; i++)
	{
		ds_queue_enqueue(_player_pile, _center_pile[|i]);
	}
	ds_list_clear(_center_pile);
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