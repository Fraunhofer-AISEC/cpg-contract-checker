quoteOwner storage new_owner = quoteOwner[_quote];
new_owner.ownerAdd = msg.sender;
new_owner.hasOwner = true;
