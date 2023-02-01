
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
                
        
        
        
        beneficiary= msg.sender
          
        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});
        
        
        
        items[1] = Item({itemId:1, itemTokens:1});
        items[2] = Item({itemId:2, itemTokens:2});
        
    }
    

    function register() public payable{
        
        
        bidders[bidderCount].personId = bidderCount;
        
        
        

        
        bidders[bidderCount].addr = msg.sender;
        
        
        bidders[bidderCount].remainingTokens = 5; 
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
    }
    
    function bid(uint _itemId, uint _count) public payable{
        
        
        
        
        
        if ( (tokenDetails[msg.sender].remainingTokens < _count) ||
             (tokenDetails[msg.sender].remainingTokens <= 0)
            ) { revert(); }
        if (_itemId > items.length - 1) { revert(); }

        
        
        
 
        
        uint balance= tokenDetails[msg.sender].remainingTokens - _count;
        
        
        tokenDetails[msg.sender].remainingTokens=balance;
        bidders[tokenDetails[msg.sender].personId].remainingTokens=balance;
        
        Item storage bidItem = items[_itemId];
        for(uint i=0; i<_count;i++) {
            bidItem.itemTokens.push(tokenDetails[msg.sender].personId);    
        }
    }
    
    
    
    modifier onlyOwner {
        
        require (msg.sender == beneficiary);
        _;
        
    }
    
    
    function revealWinners() public onlyOwner{
        
        

        for (uint id = 0; id < 3; id++) {
            Item storage currentItem=items[id];
            if(currentItem.itemTokens.length != 0){
            
            uint randomIndex = (block.number / currentItem.itemTokens.length)% currentItem.itemTokens.length; 
            

            uint winnerId = currentItem.itemTokens[randomIndex];
                
            

            
            winners[id] = bidders[winnerId].addr;
                    
            
                
            }
        }
    } 

  
    function getPersonDetails(uint id) public constant returns(uint,uint,address){
        return (bidders[id].remainingTokens,bidders[id].personId,bidders[id].addr);
    }

}
