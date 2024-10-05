if (global.turn_indicator)
{
	if (obj_deck.force_play_count > 0)
	{
		var frame = 4;
	}
	else
	{
		var frame = 1;
	}
}
else if (!global.turn_indicator)
{
	if (obj_deck.force_play_count > 0)
	{
		var frame = 3;
	}
	else
	{
		var frame = 2;
	}
}
else
{
	var frame = 0	
}


draw_sprite(spr_turn_indicator, frame, 512, 576);
draw_sprite(spr_turn_indicator, frame, 768, 128);

