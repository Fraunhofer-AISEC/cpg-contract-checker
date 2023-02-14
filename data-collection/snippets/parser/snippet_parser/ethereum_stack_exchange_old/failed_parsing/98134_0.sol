library Lib {

    
    function getMessageHash(address _to) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_to));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32) {
        
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

        function recoverSigner(bytes32 _ethSignedMessageHash, bytes memory _signature)
        public pure returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory sig) public pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(sig.length == 65, "invalid signature length");

        assembly {
            

            
            r := mload(add(sig, 32))
            
            s := mload(add(sig, 64))
            
            v := byte(0, mload(add(sig, 96)))
        }

        
    }

    function verify(address _signer, address _to, bytes memory signature) public pure returns (bool) {
        bytes32 messageHash = getMessageHash(_to);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }

}

contract MyContract{

    address public myaddr;
    ...

    function submitSignature(bytes memory signature) signerCheck public {
        if(Lib.verify(myaddr, address(this), signature)){ 
            mysignature = signature;
            ...
        }else{
            revert("Signature does not match sender.");
        }
    }

}
