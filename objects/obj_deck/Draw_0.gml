//{
//	for (var i = 0; i < 5; i++)
//	{
//		draw_sprite(spr_card_template,deck[|i], x+(150*i), y);
//		//draw_set_color(c_black);
//		//draw_text(x+(20*i)+5, y+50, deck[|i]);
//	}
//}
if keyboard_check_pressed(vk_down)
{	
	var deck_remaining = int64(ds_list_size(deck)) - 1;
	
	if deck_remaining > 0 && deck_remaining <= 52
	{
		show_debug_message("deck_remaining: " + string(deck_remaining));
		draw_sprite(spr_card_template, deck[|deck_remaining], 709, 420);
		ds_list_delete(deck, deck_remaining)
		
	}
	else
	{
		show_debug_message("deck_remaining: " + string(deck_remaining));
		show_debug_message("Error: deck is empty");
	}	
	
}