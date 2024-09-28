///@function draw_center_pile(_center_pile, _card_sprite, x, y)
///@param {ds_list} _center_pile: list representing the central pile of cards
///@param {sprite} _card_sprite: sprite containing a frame for each card in a standard deck
///@param {int} x: the x-coordinate where the sprite will be drawn
///@param {int} y: the y-coordinate where the sprite will be drawn
function draw_center_pile(_center_pile, _card_sprite, x, y)
{
	var _center_count = ds_list_size(_center_pile);
	if (_center_count > 0)
	{
		sprite_number = ds_list_find_value(_center_pile, _center_count - 1);
		draw_sprite(_card_sprite, sprite_number, x, y)
	}
}


///@function draw_player_pile(_center_pile, _card_sprite, x, y)
///@param {ds_list} _player_pile: list representing the cards in a player's hand
///@param {sprite} _card_sprite: sprite containing a frame for each card in a standard deck
///@param {int} x: the x-coordinate where the sprite will be drawn
///@param {int} y: the y-coordinate where the sprite will be drawn
function draw_player_pile(_player_pile, _card_sprite, x, y)
{
	if (ds_queue_size(_player_pile) > 0)
	{
		draw_sprite(_card_sprite, 0, x, y);
	}
}