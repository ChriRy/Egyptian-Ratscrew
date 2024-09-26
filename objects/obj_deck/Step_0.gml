// P1 turn
if (turn_indicator && keyboard_check(vk_right))
{
	scr_play_card(center_pile, p1_pile);
	turn_indicator = !turn_indicator;
}
		
// P2 turn
if (!turn_indicator && keyboard_check(ord("D")))
{
	scr_play_card(center_pile, p2_pile);
	turn_indicator = !turn_indicator;
}

