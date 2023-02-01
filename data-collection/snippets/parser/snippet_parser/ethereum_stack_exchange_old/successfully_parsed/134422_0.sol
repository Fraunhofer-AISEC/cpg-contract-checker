contract Implementation {

  function delegateTheCall (address target, string calldata action, address to) public returns (bytes memory) {

    (bool success,bytes memory dat) = target.delegatecall(abi.encodeWithSignature(action, to));
    require(success && dat != byte(0x0), "call failed"); 
    return dat;
  }
}