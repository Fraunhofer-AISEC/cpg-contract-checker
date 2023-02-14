 function bytes32ToStr(bytes32 _bytes32) public pure returns (string memory) {
     bytes memory bytesArray = new bytes(32);
     for (uint256 i; i < 32; i++) {
         bytesArray[i] = _bytes32[i];
         }
     return string(bytesArray);
     }
