//Card Sprites Key

//1: back of card art
//2-5: Ace
//6-9: Two
//10-13: Three
//14-17: Four
//18-21: Five
//22-25: Six
//26-29: Seven
//30-33: Eight
//34-37: Nine
//38-41: Ten
//42-45: Jack (11)
//46-49: Queen (12)
//50-53: King (13)


// @function scr_card_identifier(_card_frame)
/// @param {int} _card_frame: number representing a specific card
/// @return {int} card_value: the value of the given card

function scr_card_identifier(_card_frame)
{
	// Card is between Ace and 6
	if (_card_frame < 26)
	{
		// Card is between A and 3
		if (_card_frame <= 13)
		{
			// Card is A
			if (_card_frame < 6 && _card_frame > 1)
			{
				return 1;
			}
			// Card is either 2 or 3
			else
			{
				if (_card_frame < 10)
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
			if (_card_frame < 18)
			{
				return 4;
			}
			// Card is 5 or 6
			else
			{
				if (_card_frame < 22)
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
		if (_card_frame < 42)
		{
			// Card is 7 or 8
			if (_card_frame < 34)
			{
				if (_card_frame < 30)
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
				if (_card_frame < 38)
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
			if (_card_frame < 46)
			{
				return 11;
			}
			// Card is either Queen or King
			else
			{
				if (_card_frame < 50)
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


