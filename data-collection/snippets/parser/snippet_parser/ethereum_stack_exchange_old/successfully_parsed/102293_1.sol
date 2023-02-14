
pragma solidity >=0.7.0 <0.9.0;


contract TEST {
   
   function encodeBytes() public pure returns (bytes memory){
      bool x = false;
      return abi.encodePacked(x);
   }
   
   
   function decode(bytes memory data) public pure returns (bool b){
        assembly {
            
            let len := mload(data)
            
            b := mload(add(data, 0x20))
        }
    }


    function decodeAndReturn() public pure returns (bool){
        bytes memory packed = encodeBytes();
        return decode(packed);
    }
}
