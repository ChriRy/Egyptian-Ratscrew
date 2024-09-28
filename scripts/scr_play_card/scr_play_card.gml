///@function scr_play_card(center_pile, player_pile)
///@param {ds_list} _center_pile: list representing cards in the center pile
///@param {ds_queue} _player_pile: list representing cards in a player's hand
function scr_play_card(_center_pile, _player_pile)
{
	var _top_card = ds_queue_dequeue(_player_pile);
	ds_list_add(_center_pile, _top_card);
}