pragma solidity ^0.8.7;

contract MyContract{
    struct Apple{
        string id
        address payable owner;
        string propertyX; 
        uint price;
    }

    mapping(string => Apple) Apples;

    function createApple(string calldata appleId, string calldata propertyX, uint calldata price) public {
      require(msg.sender != address(0), 'Apple creator address not found');
      Apples[appleId] = Apple(appleId, msg.sender, propertyX, price);
    }

    function changeApplePrice(string calldata appleId, uint calldata price) public {
      require(Apples[appleId], 'Apple not found');
      require(msg.sender == Apples[appleId].owner, 'Only the owner of this apple can change its price');
      Apples[appleId].price = price;
    }

    function getApple(string calldata appleId) public returns (string, address, string, uint) {
      require(Apples[appleId], 'Apple not found');
      require(msg.sender == Apples[appleId].owner, 'Only the owner can see the contents of this Apple'); 
      return (appleId, Apples[appleId].owner, Apples[appleId].propertyX, Apples[appleId].price)
    }

    function buyApple(string calldata appleId) public {
        require(Apples[appleId], 'Apple not found');
        require(msg.sender != address(0), 'Buyer address not found');
        require(msg.value >= uint(Apples[appleId].price, 'Not enough money to buy this Apple')
       
        
        Apples[appleId].owner.transfer(Apples[appleId].price);

        
        Apples[appleId].owner = msg.sender;
    }
}
