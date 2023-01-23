function myFunc(MyStruct memory data) internal view returns (bool) {
  
  assembly {
    let args := mload(0x40);
    mstore(args, data.x);
    mstore(args, data.y);
    
  }
  

}
