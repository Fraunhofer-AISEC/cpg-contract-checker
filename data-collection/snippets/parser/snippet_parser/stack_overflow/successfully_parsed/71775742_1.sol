  function myDynamicFunc(uint256 someParam)
    public
    
    returns (bytes memory result) 
  {
    bytes4 selector =
      
      this.myFuncA.selector;

    (bool success, bytes memory resultBytes) =
      address(this).call(abi.encodePacked(selector, someParam));

    require(success, "failed to call selector"); 
    result = resultBytes;
  }
