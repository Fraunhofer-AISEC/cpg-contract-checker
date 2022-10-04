pragma solidity ^0.4.8;

contract cut {

    function cutSha(bytes32 source) constant returns (bytes, bytes) {
        bytes memory half1 = new bytes(16);
        bytes memory half2 = new bytes(16);
        for (uint j = 0; j < 16; j++) {
                half1[j] = source[j];
                half2[j] = source[j+16];
        }
        return (half1, half2);
    }
}
