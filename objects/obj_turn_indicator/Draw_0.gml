if (global.turn_indicator)
{
	var frame = 1;
}
else if (!global.turn_indicator)
{
	var frame = 2
}
else
{
	var frame = 0	
}

draw_sprite(spr_turn_indicator, frame, 512, 576);
draw_sprite(spr_turn_indicator, frame, 768, 128);