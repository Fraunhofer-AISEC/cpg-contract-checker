
pragma solidity ^ 0.6.0;

contract StartStop{

address owner;
bool public paused;

constructor() public{
    owner = msg.sender;
}

function ReceiveMoney() public payable{

}

function setPaused(bool _paused) public{
    require(owner == msg.sender, "You are not the owner");
    paused = _paused;
}

function sendMoneyTo(address payable _to) public{
    require(owner == msg.sender, "You are not the owner.");
    require(!paused, "The smart contract has been paused");
    _to.transfer(address(this).balance);
}

function destroySmartContract(address payable _to) public{
    require(owner == msg.sender, "You are not the owner");
    selfdestruct(_to);
}

}
