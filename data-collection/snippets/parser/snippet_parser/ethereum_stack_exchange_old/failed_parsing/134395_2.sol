function mint(address to, string calldata _uri) public onlyRoot {
     
  }



  modifier onlyRoot{
    emit SenderAddress(msg.sender);
    string memory message = string.concat("caller ",  Strings.toHexString(uint160(msg.sender), 20) , " is not the contract root.");
    require(rootAddress == msg.sender, message);
    _;
  }
