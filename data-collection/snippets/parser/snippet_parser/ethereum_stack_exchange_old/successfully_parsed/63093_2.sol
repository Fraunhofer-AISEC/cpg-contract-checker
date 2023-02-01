
  function getArray(address _addr) public view returns (address[] memory) {
      return addressToHandler[_addr]._ownerProducts;
  }
