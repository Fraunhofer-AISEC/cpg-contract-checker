pragma solidity ^0.8.4;

contract Contract {
    address payable public owner;
    address payable public charity;

    constructor(address payable _charity) {
        owner = payable(msg.sender);
        charity = _charity;
    }

    receive() external payable { }

    function donate() public {
        charity.transfer(address(this).balance);
    }

    function tip() public payable {
        owner.transfer(msg.value);
    }
}
