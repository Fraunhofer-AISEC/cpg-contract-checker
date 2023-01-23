  function callSetN(address _e, uint256 _n) public {
    _e.call(abi.encodeWithSignature("setN(uint256)", _n)); 
  }


  function delegatecallSetN(address _e, uint _n) public {
    _e.delegatecall(abi.encodeWithSignature("setN(uint256)", _n));
  }
