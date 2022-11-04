pragma solidity ^0.4.2;

contract Test {
    function toBytesNickJohnson(uint256 x) constant returns (bytes b) {
        b = new bytes(32);
        assembly { mstore(add(b, 32), x) }
    }

    function toBytesEth(uint256 x) constant returns (bytes b) {
        b = new bytes(32);
        for (uint i = 0; i < 32; i++) {
            b[i] = byte(uint8(x / (2**(8*(31 - i))))); 
        }
    }

    function toBytesNicolasMassart(uint256 x) constant returns (bytes c) {
        bytes32 b = bytes32(x);
        c = new bytes(32);
        for (uint i=0; i < 32; i++) {
            c[i] = b[i];
        }
    }    
}
