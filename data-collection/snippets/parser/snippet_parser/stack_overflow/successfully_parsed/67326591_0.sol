pragma solidity ^0.8.4;

contract Test {
    
    mapping(uint => S_Item) public items;
    uint itemIndex;
    
    enum State {
        Created,
        Paid,
        Delivered
    }
    
    struct S_Item {
        string _identifier;
        uint _itemPrice;
        State _state;
    }
    
    State public state;
    
    event SupplyChainStep(uint _itemIndex, uint _step);
    
    function createItem(string memory _identifier, uint _itemPrice) public {
        items[itemIndex]._identifier = _identifier;
        items[itemIndex]._itemPrice = _itemPrice;
        state = State.Created;
        items[itemIndex]._state = state;
        emit SupplyChainStep(itemIndex, uint(items[itemIndex]._state));
        itemIndex++;
        
    }
    
    function triggerPayment(uint _itemIndex) public payable {
        require(items[_itemIndex]._itemPrice == msg.value, "Only full payments accepted");
        require(items[_itemIndex]._state == State.Created, "Item is further in the chain");
        state = State.Paid;
        items[itemIndex]._state = state;
        
        emit SupplyChainStep(itemIndex, uint(items[itemIndex]._state));

    }
    
    function triggerDelivery(uint _itemIndex) public {
        require(items[_itemIndex]._state == State.Paid, "Item is further in the chain");
        state = State.Delivered;
        items[itemIndex]._state = state;
    
        
        emit SupplyChainStep(itemIndex, uint(items[itemIndex]._state));
    }
}

