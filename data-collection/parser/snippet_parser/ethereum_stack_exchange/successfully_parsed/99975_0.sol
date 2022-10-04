contract Provider {
  uint public constant value = 42;                                                                                                               
  event Caller(address addr);                                                                                                                    

  function provide() external returns (uint) {                                                                                                   
    emit Caller(msg.sender);                                                                                                                     
    return value;
  } 
} 
