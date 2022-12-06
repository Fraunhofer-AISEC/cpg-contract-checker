pragma solidity ^0.4.22;

contract id{

uint public id;
uint public senderValue;
uint256 public gasUsed;

constructor() public {
    senderValue= msg.sender;
}

function setId(uint _id) public {
    uint256 gasInitial = gasleft();
    id= _id;
    setGasUsed(gasInitial - gasleft());
}

function setGasUsed(uint256 _gasUsed) private {
    gasUsed = _gasUsed;
}
}