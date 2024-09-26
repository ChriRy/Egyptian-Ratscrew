function scr_draw_pile_player(player_pile, card_sprite, card_rear_frame, x, y)
{
	if (ds_queue_size(player_pile) > 0)
	{
		draw_sprite(card_sprite, card_rear_frame - 1, x, y);
	}
}