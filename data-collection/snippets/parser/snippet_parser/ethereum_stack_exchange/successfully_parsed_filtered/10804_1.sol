function bytes32ToString (bytes32 data) returns (string) {
    bytes memory bytesString = new bytes(32);
    for (uint j=0; j<32; j++) {
      byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
      if (char != 0) {
        bytesString[j] = char;
      }
    }

    return string(bytesString);
  }

   function My_integ(bytes32 myInteger) returns (string){

        string memory myString= bytes32ToString( myInteger );
return myString;
   }   
