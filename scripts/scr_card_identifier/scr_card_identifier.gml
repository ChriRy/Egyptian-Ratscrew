//Card Sprites Key

//0: back of card art
//1-4: Ace
//5-8: Two
//9-12: Three
//13-16: Four
//17-20: Five
//21-24: Six
//25-28: Seven
//29-32: Eight
//33-36: Nine
//37-40: Ten
//41-44: Jack (11)
//45-48: Queen (12)
//49-52: King (13)


// @function scr_card_identifier(_card_frame)
/// @param {int} _card_frame: number representing a specific card
/// @return {int} card_value: the value of the given card

function scr_card_identifier(_card_frame)
{
	// Card is between Ace and 6
	if (_card_frame < 25)
	{
		// Card is between A and 3
		if (_card_frame <= 12)
		{
			// Card is A
			if (_card_frame < 5 && _card_frame > 0)
			{
				return 1;
			}
			// Card is either 2 or 3
			else
			{
				if (_card_frame < 9)
				{
					return 2;
				}
				else
				{
					return 3;
				}
			}	
		}
		// Card is between 4 and 6
		else
		{
			// Card is 4
			if (_card_frame < 17)
			{
				return 4;
			}
			// Card is 5 or 6
			else
			{
				if (_card_frame < 21)
				{
					return 5;
				}
				else
				{
					return 6;
				}
			}		
		}
	}
	
	// Card is between 7 and King
	else
	{
		// Card is between 7 and 10
		if (_card_frame < 41)
		{
			// Card is 7 or 8
			if (_card_frame < 33)
			{
				if (_card_frame < 29)
				{
					return 7;
				}
				else
				{
					return 8;
				}
			}
			// Card is 9 or 10
			else
			{
				if (_card_frame < 37)
				{
					return 9;
				}
				else
				{
					return 10;
				}
			}
		}
		// Card is between Jack and King
		else 
		{
			// Card is Jack
			if (_card_frame < 45)
			{
				return 11;
			}
			// Card is either Queen or King
			else
			{
				if (_card_frame < 49)
				{
					return 12;
				}
				else
				{
					return 13;
				}			
			}
		}
	}
}


