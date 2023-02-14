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
        items[1] = Item({itemId:1,itemTokens:emptyArray}); 
        items[2] = Item({itemId:2,itemTokens:emptyArray}); 
    }

    function register() public payable{
        bidders[bidderCount].personId = bidderCount;
        bidders[bidderCount].addr = addr;                  
        bidders[bidderCount].remainingTokens = 5;          
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++; 
    }

    function bid(uint _itemId, uint _count) public payable{
        if (tokenDetails[msg.sender].remainingTokens < _count) return; 
        if (_itemId > 2) return;                                       
        (tokenDetails[msg.sender].remainingTokens - _count);           
        bidders[tokenDetails[msg.sender].personId].remainingTokens= tokenDetails[msg.sender].remainingTokens; 
        Item storage bidItem = items[_itemId]; 
        for(uint i=0; i<_count;i++) { 
            bidItem.itemTokens.push(tokenDetails[msg.sender].personId); 
        }
    }

    function revealWinners() public {
         for (uint id = 0; id < 3; id++) { 
             Item storage currentItem=items[id]; 
             If (currentItem.itemTokens.length != 0);
                 uint randomIndex = (block.number / currentItem.itemTokens.length)% currentItem.itemTokens.length; 
                 uint winnerId = currentItem.itemTokens[randomIndex];
                 return winnerId;                                      
            }
        }
    }

    
    function getPersonDetails(uint id) public constant returns(uint,uint,address){
      return (bidders[id].remainingTokens,bidders[id].personId,bidders[id].addr); 
    }
}
