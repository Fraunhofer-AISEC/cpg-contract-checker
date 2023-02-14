function addAsk (uint _amount, uint _price) public {
    string memory _timestamp = uint2str(block.timestamp);
    Ask storage ask = asks[msg.sender];
    ask.asker = msg.sender;
    ask.amount = _amount;
    ask.price = _price;
    ask.timestamp = _timestamp;
    ask_ids.push(msg.sender);
    
    credits.transferFrom(msg.sender, address(this), _amount);
    emit AskPlaced(msg.sender, _amount, _price, _timestamp, tick);
  }
