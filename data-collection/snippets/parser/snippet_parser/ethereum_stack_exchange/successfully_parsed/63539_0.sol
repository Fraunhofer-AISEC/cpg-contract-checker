pragma solidity ^0.4.19;

contract PayEther {
    mapping(address => bool) payedCustomer;
    uint64 private peopleThatPayed;
    address private owner;

    constructor(uint minimumAmount) public {
        owner = msg.sender;
        peopleThatPayed = 0;
    }

    function pay() payable public {
        require(msg.value > 0, "Address didn't send enough money.");
        payedCustomer[msg.sender] = true;
        peopleThatPayed++;
    }

    function findHowManyPeoplePayed() view public returns (uint64){
        require(payedCustomer[msg.sender], "Address never payed!");
        return peopleThatPayed;
    }
}
