function deposit(uint _amount) public{
    
    myToken.transferFrom(msg.sender, address(this), _amount);

    uint shares;
    if(totalShares == 0){
        shares = amountDeposited;
    } else {
        shares = _amount * totalShares / poolSize; 
    }
    totalShares += shares;

    _mint(msg.sender, shares);
}

function poolSize() public returns(uint){
    return IERC20(myToken).balanceOf(address(this));

}