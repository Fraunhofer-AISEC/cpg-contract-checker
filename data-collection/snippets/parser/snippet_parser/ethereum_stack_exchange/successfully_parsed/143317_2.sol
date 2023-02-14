contract MyContract{
  bool a = true;
  address b=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
  
  function getAddress() public view returns (address){
    assembly {
        mstore(0x40, shr(8, and(sload(0),0x00000000000000000000ffffffffffffffffffffffffffffffffffffffffff00)))
       return(0x40, 0x60)    
    }
  }

}
