function () public payable {
    require(msg.value > 0);
    token.transfer(msg.sender, 1000000000000000000000); 
}
