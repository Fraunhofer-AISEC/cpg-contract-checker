
function buy() payable public {
    uint amount = msg.value / buyPrice;               
    _transfer(this, msg.sender, amount);              
}
