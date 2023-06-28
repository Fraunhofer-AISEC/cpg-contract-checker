function transfer(address _to, uint256 _value) isRunning validAddress public returns (bool success) {
    require(balanceOf[msg.sender] >= _value,"Insufficient balance.");
    require(balanceOf[_to] + _value >= balanceOf[_to],"Pass a correct value."); 
}
