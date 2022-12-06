

pragma solidity ^0.8.11;

library CryptoSuite {

    function splitSignature(bytes memory _sign) internal pure returns(uint8 v, bytes32 r, bytes32 s) {
        
        require(_sign.length == 65);

        
        assembly {

            
            r := mload(add(_sign, 32))
            
            s := mload(add(_sign, 64))
            
            v := byte(0, mload(add(_sign, 96))
            
        } 

        return (v, r, s);
        
    }

    

    function recoverSigner(bytes32 _message, bytes memory _sign) internal pure returns(address){
        

        (uint8 v, bytes32 r, bytes32 s) = splitSignature(_sign);

        return ecrecover(_message, v, r, s);

    } 

}
