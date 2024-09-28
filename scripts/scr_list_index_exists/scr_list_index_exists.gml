
///@function scr_list_index_exists(_list, _index);
///@param {ds_list} _list: a ds_list structure
///@param {int} _index: a possible index within the list
///@return {bool} bool: tells if the index exists or not
function scr_list_index_exists(_list, _index)
{
	var _list_max = ds_list_size(_list) - 1;
	
	if (0 <= _index && _index <= _list_max)
	{
		return true;
	}
	else
	{
		return false;
	}

}