function toAddress(string calldata toadd) public returns (address) {
      return address(bytes20(sha256(abi.encodePacked(toadd,block.timestamp))));
   }
