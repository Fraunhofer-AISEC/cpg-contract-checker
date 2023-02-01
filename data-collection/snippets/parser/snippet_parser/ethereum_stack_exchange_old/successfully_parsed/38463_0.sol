contract Example { 
  address[] addresses;

  function getAddress(uint index) external view returns (address){
      return addresses[index];
  }

  function getAddress1(uint index) external view returns (address) {
      require(index < addresses.length);
      return addresses[index];
  }
 }
