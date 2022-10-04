
pragma solidity ^0.8.4;

contract Test {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function withdraw() public {
        require(msg.sender == owner, "Owner issue");

        owner.transfer(address(this).balance);
    }
}
