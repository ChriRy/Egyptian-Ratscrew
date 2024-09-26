function check_card_pile(pile)
{
	var size = ds_list_size(pile) - 1;
	for (var i = 0; i < size; i++)
	{
		show_debug_message(string(pile[|i]))
	}
}