  function example(string param1, string param2, string param3, uint256 param4) public {
    if (current == address(this)) {
      do things...
    }
    else {
      current.delegatecall(bytes4(sha3("example(string,string,string,uint256)")), param1, param2, param3, param4);
    }
  }
