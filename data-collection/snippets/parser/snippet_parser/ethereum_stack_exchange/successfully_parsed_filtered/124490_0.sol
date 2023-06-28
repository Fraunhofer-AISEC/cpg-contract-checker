
pragma solidity ^0.8.0;

contract Demo {
     
    function encode(uint8 a, uint16 b, bool c, string calldata d) external pure returns(bytes memory) {
      return abi.encode(a,b,c,d);
    }

        function encodePacked(uint8 a, uint16 b, bool c, string calldata d) external pure returns(bytes memory) {
      return abi.encodePacked(a,b,c,d);
    }
}
