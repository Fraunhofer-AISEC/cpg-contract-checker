pragma solidity ^0.5;

contract TestString {
    function stringConcat(string memory a, string memory b) public pure returns (string memory) {
       bytes memory bytesA = bytes(a);
       bytes memory bytesB = bytes(b);

       string memory finalLength = new string(bytesA.length + bytesB.length);

       bytes memory finalBytes = bytes(finalLength);

       uint256 k = 0;
       for(uint256 i = 0; i < bytesA.length; i++) {
           finalBytes[k++] = bytesA[i];
       }

       for(uint256 i = 0; i < bytesB.length; i++) {
           finalBytes[k++] = bytesB[i];
       }

       return string(finalBytes);
    }
}
