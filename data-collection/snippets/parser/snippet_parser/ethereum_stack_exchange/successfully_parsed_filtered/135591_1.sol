

pragma solidity ^0.8.16;

contract Contract {

    function splitSignature(bytes memory sig)
        public
        pure
        returns (uint8 v, bytes32 r, bytes32 s)
    {
        require(sig.length == 65);

        assembly {
            
            r := mload(add(sig, 32))
            
            s := mload(add(sig, 64))
            
            v := byte(0, mload(add(sig, 96)))
        }

        return (v, r, s);
    }

    function splitSignatureWithSlicing(bytes calldata sig) public pure returns (uint8 v, bytes32 r, bytes32 s){

        r = bytes32(sig[0:32]); 

        s = bytes32(sig[32:64]); 

        v = uint8(bytes1(sig[64:65])); 

    }
    
}
