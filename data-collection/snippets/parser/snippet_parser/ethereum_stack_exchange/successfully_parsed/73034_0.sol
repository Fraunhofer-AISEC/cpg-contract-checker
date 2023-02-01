    emit Transfer(address(this), msg.sender, DividendstoDividend);
emit Transfer(address(this), address(0), DividendsToBurn);
_SavedDividend[msg.sender] = 0;
RestrictedFromDividend[msg.sender] = true;
