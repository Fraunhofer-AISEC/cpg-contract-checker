  {   
    require(block.timestamp < start + buyPeriod);
    require(1 ether == msg.sender);<--- error got here
    require(_tickets[msg.sender] == 0);
    _tickets[msg.sender] = hash;
    _entries.push(msg.sender);
    return true;
    }  
Getting error as Getting TypeError: Operator == not compatible with 
types int_const 1000000000000000000 and address payable.
