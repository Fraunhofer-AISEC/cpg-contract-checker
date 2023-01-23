function tipPoolOwner() public payable{
    require(msg.value > 0);
    require(msg.sender != owner());
    address payable poolOwner = address(uint160(owner()));
    poolOwner.transfer(msg.value);
    emit TipSent(msg.sender, msg.value);
}
