function shuffle_deck(card_deck)
{
	cards_in_deck = 52;
	
	for (var i = 0; i < cards_in_deck; i++)
	{
		ds_list_add(card_deck, i);
	}
	
	randomize();
	ds_list_shuffle(card_deck);
}

function deal_cards(main_deck, pile_1, pile_2)
{
	deck_remaining = ds_list_size(main_deck) - 1;
	current_turn = true;
	
	for (var i = deck_remaining; i > 0; i--)
	{
		if (current_turn)
		{
			ds_queue_enqueue(pile_1, main_deck[|i]);
		}
		else
		{
			ds_queue_enqueue(pile_2, main_deck[|i]);
		}
		current_turn = !current_turn;
	}
	
	ds_list_clear(main_deck);
}


// Set card sprites
card_sprite = spr_card_template;

// Create turn indicator
turn_indicator = true;

// Create card piles for the center, p1, and p2.
center_pile = ds_list_create();
p1_pile = ds_queue_create();
p2_pile = ds_queue_create();
show_debug_message("lists created");
	
shuffle_deck(center_pile);
show_debug_message("deck shuffled");
	
deal_cards(center_pile, p1_pile, p2_pile);
show_debug_message("cards dealt");











