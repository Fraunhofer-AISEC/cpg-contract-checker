...
constructor (){
    Owner = msg.sender;
}


event SuccessfullTransfer(address receiver, uint amount);

function loadCoin(uint amount) public {
    require(Owner == msg.sender);
    myCoin[Owner] += amount;
}
....
