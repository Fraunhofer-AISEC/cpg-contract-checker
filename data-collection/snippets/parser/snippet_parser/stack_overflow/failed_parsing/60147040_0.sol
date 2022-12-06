
ERC20(AToken).transferFrom(msg.sender, address(this), amount);



... trade logic here 




uint256 returnAmount = ERC20(BToken).balanceOf(address(this));



ERC20(BToken).transfer(msg.sender, returnAmount);
