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
                
        
        
        
         beneficiary = msg.sender;
          
        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});
        
        
        
        items[1] = Item({itemId:1, itemTokens:1});
        items[2] = Item({itemId:2, itemTokens:2});
        
    }
}