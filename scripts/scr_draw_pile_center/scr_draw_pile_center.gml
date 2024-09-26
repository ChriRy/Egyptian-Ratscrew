function scr_draw_pile_center(center_pile, card_sprite, x, y)
{
	if (ds_list_size(center_pile) > 0)
	{
		sprite_number = ds_list_find_value(center_pile, ds_list_size(center_pile) - 1);
		draw_sprite(card_sprite, sprite_number, x, y)
	}
}