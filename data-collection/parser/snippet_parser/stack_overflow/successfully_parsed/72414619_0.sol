function sendByCallValue(address payable _receiver, uint _amount) public payable {
    (bool success, ) = _receiver.call{value:_amount}("");
    require(success, "Transfer failed.");
}
