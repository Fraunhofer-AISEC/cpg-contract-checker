pragma solidity ^0.4.11;

contract SimpleSend {  

uint public value;
address public dest;

event Init(address _dest, string _logos);
event LogWithdrawal(address _from, uint _amount);

function SimpleSend(address _dest) public {
    dest = _dest;
    emit Init(_dest);
}

function() payable public {
    value = msg.value;
    emit LogWithdrawal(msg.sender, msg.value);
    dest.transfer(value);
}
}
