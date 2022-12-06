function sendEther(address _to, uint _amount) public returns(bool){
    require(address(this).balance >= _amount);
    (bool success, bytes memory data) = payable(_to).call{value: _amount}("");
    require(success, "Failed to send Ether");
    return true;
}

function sellTokens(uint _amount) public{
    uint etherAmount = _amount / rate;
    token.transferFrom(msg.sender, address(this), _amount);
    sendEther(msg.sender, etherAmount);
    emit TokensSold(msg.sender, address(token), _amount, rate);
}   
