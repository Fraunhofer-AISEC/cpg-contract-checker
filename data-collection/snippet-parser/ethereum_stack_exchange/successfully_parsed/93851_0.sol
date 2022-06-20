 function appDai(uint _amount) public {
    daitoken.approve(msg.sender, _amount);
 }

function depDai(uint _amount) public {
    require(daitoken.balanceOf(msg.sender) >= _amount);
    daitoken.transferFrom(msg.sender, address(this), _amount);
    emit Deposit(msg.sender, _amount);
}
