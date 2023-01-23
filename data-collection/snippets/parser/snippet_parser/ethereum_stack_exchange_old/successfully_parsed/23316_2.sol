pragma solidity ^0.4.10;

contract test{

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
    mapping (uint256 => string) uintTostring;

   function f(uint i){
       uintTostring[i]=bytes32ToString(bytes32(i));
   } 
}
