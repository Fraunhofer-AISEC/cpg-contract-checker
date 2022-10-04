    function validate(string memory strTest,uint8 v, bytes32 r, bytes32 s) public view returns(address){
      bytes32 prefixedHash = keccak256(strTest);
      return ecrecover(keccak256(prefixedHash),v,r,s);
      
   }
