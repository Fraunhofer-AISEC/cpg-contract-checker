pragma solidity ^0.4.0;

contract Auth {   

    string public name;

    function Auth(){
        name = "Auth 1.0";
    }

    function verify(bytes32 _message, uint8 _v, bytes32 _r, bytes32 _s) constant returns (address) {
        address signer = ecrecover(_message, _v, _r, _s);
        return signer;
    }

    function verifyWithPrefix(bytes32 _message, uint8 _v, bytes32 _r, bytes32 _s) constant returns (address) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = sha3(prefix, _message);
        address signer = ecrecover(prefixedHash, _v, _r, _s);
        return signer;
    }
}
