pragma solidity ^0.5.4;
contract GuessTheNumberChallenge {
    constructor() public payable {
        require(msg.value == 1 ether);
    }

}
