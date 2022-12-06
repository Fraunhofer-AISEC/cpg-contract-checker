uint256 mult = (_type == 1 ? 5 : 2);
uint256 value = (((_amount / 1e18) * (getPrice() / 1e18)) / 10) * mult * 1e18;
