contract AdAuction {
address currentOwner;
uint currentAmount = 0 wei;

event advertisement(address owner, uint amount);

function makeAd() public payable {
    require(msg.value > currentAmount, "Pay more to make changes");
    
    currentOwner = msg.sender;
    currentAmount = msg.value;
    emit advertisement(msg.sender, msg.value);
}

function getOwner() external view returns (address) {
    return currentOwner;
}

function getAmount() external view returns (uint amount) {
    return currentAmount;
}
}