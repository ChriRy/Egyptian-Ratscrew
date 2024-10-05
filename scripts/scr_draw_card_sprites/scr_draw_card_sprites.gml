///@function draw_center_pile(_center_pile, _card_sprite, x, y)
///@param {ds_list} _center_pile: list representing the central pile of cards
///@param {sprite} _card_sprite: sprite containing a frame for each card in a standard deck
///@param {int} x: the x-coordinate where the sprite will be drawn
///@param {int} y: the y-coordinate where the sprite will be drawn
function draw_center_pile(_center_pile, _card_sprite, x, y)
{
	var _center_pile_size = ds_list_size(_center_pile) - 1;
	if (ds_list_size(_center_pile) > 0)
	{
		var _sprite_number = _center_pile[|_center_pile_size];
		draw_sprite(_card_sprite, _sprite_number, x, y)
	}
	
	draw_text(640, 128, string(_center_pile_size + 1));
}


///@function draw_player_pile(_center_pile, _card_sprite, x, y)
///@param {ds_list} _player_pile: list representing the cards in a player's hand
///@param {sprite} _card_sprite: sprite containing a frame for each card in a standard deck
///@param {int} x: the x-coordinate where the sprite will be drawn
///@param {int} y: the y-coordinate where the sprite will be drawn
///@param {int} a: the x-coordinate where the card text will be drawn
///@param {int} b: the y-coordinate where the card text will be drawn
function draw_player_pile(_player_pile, _card_sprite, x, y, a, b)
{
	if (ds_queue_size(_player_pile) > 0)
	{
		draw_sprite(_card_sprite, 0, x, y);
	}
	
	var _player_pile_size = ds_queue_size(_player_pile);
	draw_text(a, b, string(_player_pile_size));
}


