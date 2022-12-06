pragma solidity ^0.5.0;

contract SalesContract {

    address payable public owner;
    bool public isSold = false;
    string public salesDescription = "Honda Civic";
    uint public price = 2 ether;

    constructor() public {
        owner = msg.sender;
    }

    function Buy() public payable {
        if(msg.value >= price) {
            owner.transfer(address(this).balance);
            owner = msg.sender;
            isSold = true;
        } else {
            revert();
        }
    }

}
