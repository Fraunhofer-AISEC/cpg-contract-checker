function buy() payable public {
    uint amount = msg.value / buyPrice;                 
    _transfer(address(this), msg.sender, amount);       
}
