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
    
    

    function Auction() 
    
    public payable{    
                
        
        
        
        beneficiary = msg.sender;
          
        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});
        
        
        
        uint[] memory emptyArray1;
        items[1] = Item({itemId:1,itemTokens:emptyArray1});
        uint[] memory emptyArray2;
        items[2] = Item({itemId:2,itemTokens:emptyArray2});
        
    }
    

    function register() 
    
    public payable{
        
        
        bidders[bidderCount].personId = bidderCount;
        
        
        

        
        bidders[bidderCount].addr = msg.sender;
        
        
        bidders[bidderCount].remainingTokens = 5; 
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
    }
}