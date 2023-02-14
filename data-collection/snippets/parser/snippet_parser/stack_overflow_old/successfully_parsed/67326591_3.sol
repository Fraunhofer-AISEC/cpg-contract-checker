function triggerPayment(uint _itemIndex,State s) public payable {
        require(items[_itemIndex]._itemPrice == msg.value, "Only full payments accepted");
        require(items[_itemIndex]._state == State.Created, "Item is further in the chain");
        
        items[itemIndex]._state.push(s);
        
        emit SupplyChainStep(itemIndex, uint(items[itemIndex]._state));

    }
