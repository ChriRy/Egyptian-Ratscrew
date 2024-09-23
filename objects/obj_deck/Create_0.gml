{
	deck = ds_list_create();
	draw_pile = ds_list_create();
	key_down = false;
	
	CARDS_IN_DECK = 52;
	
	for (var i = 0; i < CARDS_IN_DECK; i++)
	{
		ds_list_add(deck, i);
	}
	
	randomize();
	ds_list_shuffle(deck);

}