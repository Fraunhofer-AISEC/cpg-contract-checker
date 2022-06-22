

pragma solidity >=0.7.0 <0.9.0;


contract TEST {
   
   function encodeBytes() public pure returns (bytes memory){
       
      bool x = false;
       return abi.encodePacked(x);
   }
   
   
   function decode(bytes memory data) public pure returns ( bool b) {
        assembly {
            b := mload(
                add(
                    data,
                    8
                )
            )

        }
    }


    function decodeAndReturn() public returns (bool){
        bytes memory packed = encodeBytes();
        return decode(packed);
    }
}
