uint bal = IERC20(_token2).balanceOf(address(this));
require(bal >= _amount2, 'Balance too low');
