  
  constructor () internal { 
    address"msgSender" = _msgSender();
    _owner = msgSender;
    emit OwnershipTransferred(address(0), msgSender); 
  }
