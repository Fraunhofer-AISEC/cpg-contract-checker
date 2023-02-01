modifier isICOCompleted() {
    require(now >= endOfICO);
    _;
}

modifier isContractOwner() {
    require(msg.sender == owner);
    _;
}

function transfer(address _to, uint _amount) isICOCompleted public {
    
}
