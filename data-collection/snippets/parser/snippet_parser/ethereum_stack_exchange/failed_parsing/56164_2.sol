pragma solidity ^0.4.17;
contract Auction {

    
    
    struct Item {
        uint itemId; 
        uint[] itemTokens;  

    }

   
    struct Person {
        uint remainingTokens; 
        uint personId; 
        address addr;
    }

    mapping(address => Person) tokenDetails; 
    Person [4] bidders;

    Item [3] public items;
    address[3] public winners;
    address public beneficiary;

    uint bidderCount=0;

    

    function Auction() public payable{    
  ......................
