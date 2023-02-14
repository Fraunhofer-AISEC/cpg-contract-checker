Contract MyContract{
  bool a;
  address b;
  
  function getAddress() public returns (address){
    assembly {
      mstore(mload(0x40), sload(1))
      return(0x40, 32)    
    }
  }
}
