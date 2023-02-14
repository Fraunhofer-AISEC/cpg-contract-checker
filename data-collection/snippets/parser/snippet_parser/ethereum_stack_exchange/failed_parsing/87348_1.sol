function getMultipleAddresses( string[] calldata ids) public view returns (address[] memory) {

    address[] memory _addresses;
    
    for (uint256 i = 0; i < ids.length; i++) {
      string memory id = ids[i];
      require(_idToAddress[id] != address(0), 'Missing address');
      address payable _address = payable(_addresses[i]);

      _addresses[i] = _address;
    }
