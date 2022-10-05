
  
  constructor () internal { 
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), msg.sender); 
  }
