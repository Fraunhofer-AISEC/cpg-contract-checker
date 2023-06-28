
pragma solidity ^0.8.7;

import './ExampleToken.sol';

contract MyContract {

    address public owner;
    uint public EXMbalance;
    ExampleToken public exampleToken;

    constructor() {
        owner = msg.sender;
        exampleToken = new ExampleToken();
        EXMbalance = exampleToken.balanceOf(address(this));
    }

    function getBalanceOf(address adr) public view returns(uint) {
        return exampleToken.balanceOf(adr) / 10**18;
    }

    function contractBalance() public view returns(uint) {
        return address(this).balance ;
    }

    function requestEXM(uint quantity) public {
        require(quantity <= 100 && quantity > 0);

        exampleToken.approve(address(this), quantity);
        exampleToken.transferFrom(address(this), msg.sender, quantity);
        EXMbalance -= quantity;
    }

    function invest() external payable {

    }

}
