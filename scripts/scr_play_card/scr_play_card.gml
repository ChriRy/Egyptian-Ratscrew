function scr_play_card(center_pile, player_pile)
{
	top_card = ds_queue_dequeue(player_pile);
	ds_list_add(center_pile, top_card);
}