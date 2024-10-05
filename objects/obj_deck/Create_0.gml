///@function shuffle_deck(card_deck);
///@param {ds_list} _card_deck: a ds_list to store card values in
function shuffle_deck(_card_deck)
{
	cards_in_deck = 52;
	
	for (var i = 1; i <= cards_in_deck; i++)
	{
		ds_list_add(_card_deck, i);
		show_debug_message("Adding to deck:" + string(i));
	}
	show_debug_message("Size of main deck: " + string(ds_list_size(_card_deck)));
	
	randomize();
	ds_list_shuffle(_card_deck);
}

///@function deal_cards(_main_deck, _pile_1, _pile_2);
///@param {ds_list} _main_deck: the list representing cards in the center pile
///@param {ds_list} _pile_1: the list representing cards in p1's hand
///@param {ds_list} _pile_2: the list representing cards in p2's hand
function deal_cards(_main_deck, _pile_1, _pile_2)
{
	_deck_remaining = ds_list_size(_main_deck) - 1;
	show_debug_message("Size of main deck: " + string(_deck_remaining));
	_current_turn = true;
	
	for (var i = _deck_remaining; i >= 0; i--)
	{
		if (_current_turn)
		{
			ds_queue_enqueue(_pile_1, _main_deck[|i]);
		}
		else
		{
			ds_queue_enqueue(_pile_2, _main_deck[|i]);
		}
		_current_turn = !_current_turn;
	}
	
	ds_list_clear(_main_deck);
}


// Set card sprites
card_sprite = spr_card_template;

// Create card piles for the center, p1, and p2.
center_pile = ds_list_create();
p1_pile = ds_queue_create();
p2_pile = ds_queue_create();

// Create variables that keep track of who slapped first
p1_slap_time = -1;
p2_slap_time = -1;

// Create variables for implementing face card functionality
force_play_loop = false;
force_play_count = 0;

// Variable to keep slap check from running too many times
slap_check_happening = false

// Shuffles the card values in the deck
shuffle_deck(center_pile);

// Deals the cards between p1_pile and p2_pile, leaving center_pile empty at the end
deal_cards(center_pile, p1_pile, p2_pile);

// Alarm for ensuring that slaps at wrong times cause players to wait. 
alarm[0] = 0;










