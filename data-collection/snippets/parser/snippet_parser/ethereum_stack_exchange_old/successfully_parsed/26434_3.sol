pragma solidity ^0.8.4;

    contract slipt{

      function splitSignature(bytes memory sig) public pure returns (bytes32 r, bytes32 s, uint8 v) {`
        require(sig.length == 65, "invalid signature length");

        assembly {

        
        r := mload(add(sig, 32))
        
        s := mload(add(sig, 64))
        
        v := byte(0, mload(add(sig, 96)))
        }

        
       }
     }
