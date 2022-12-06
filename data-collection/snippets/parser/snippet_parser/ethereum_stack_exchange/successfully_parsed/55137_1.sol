pragma solidity ^0.4.18;

contract Testing{
    address [] public adds;
    uint [] public amounts;

    function bet() public payable {
        adds.push(msg.sender);
        amounts.push(msg.value);
    }

    function give() public {
        adds[0].transfer(amounts[0]);
    }
}
