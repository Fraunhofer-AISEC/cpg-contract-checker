    function getSigner(uint _amount, bytes memory _signature) 
    public 
    pure 
    returns(address) {
        bytes32 _prefixHash = 
         ECDSA.toEthSignedMessageHash(keccak256(abi.encodePacked("Please sign the 
         message for claiming the reward amount of ", _amount, " tokens!")));
        
        return ECDSA.recover(_prefixHash, _signature);
    }
