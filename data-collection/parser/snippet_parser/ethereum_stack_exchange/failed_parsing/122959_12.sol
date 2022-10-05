interface ICalledByMarket {
  function functionName(uint256 param1, address param2) external;
}

contract CalledByMarket is ICalledByMarket {
  function functionName(uint256 param1, address param2) {
    
  }

  
}

contract Market {
  `onlyAuthorizedCaller` is a modifier with whatever protection logic you want
  function callOtherContract(uint256 param1, address param2) public is onlyAuthorizedCaller {
    ICalledByMarket(otherContractAddress).functionName(param1, param2);
  }

  
}
