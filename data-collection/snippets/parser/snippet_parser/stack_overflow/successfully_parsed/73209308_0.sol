    library CryptoSuite { function splitSignature(bytes memory sig) internal pure returns(uint8 v, bytes32 r, bytes32 s) {
        require(sig.length == 65);
 
        assembly{
            
            r := mload(add(sig, 32))
 
            
            s := mload(add(sig, 64))
 
            
            v := byte(0, mload(add(sig,96)))
        }
        return (v, r, s);
    }
    function recoverSigner(bytes32 message, bytes memory sig) internal pure returns (address) {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(sig);
        return ecrecover(message, v, r, s);   
       }
    }

       function isMatchingSignature(bytes32 message, uint id, address issuer) public view returns (address) {
       Certificate memory cert = certificates[id];
       require(cert.issuer.id == issuer);
       
       address recoveredSigner = CryptoSuite.recoverSigner(message, cert.signature);
       return recoveredSigner == cert.issuer.id;
   } 
