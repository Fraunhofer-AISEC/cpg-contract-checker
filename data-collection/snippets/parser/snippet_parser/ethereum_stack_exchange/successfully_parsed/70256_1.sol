    function commitSignatureHash(uint256 index, uint256 space, bytes32 hashToVerify) public {
        require(whitelistForSpace[space][index] == msg.sender);
        latestCommittedHashByAddressBySpace[space][msg.sender] = hashToVerify;
        timeStampByAddressBySpace[space][msg.sender] = now;
    }


    function verifySignature(address userRegisteringSpace, uint256 space, uint8 v, bytes32 r, bytes32 s) public view returns (bool){
        bytes32 hashToVerify = keccak256(
            abi.encodePacked(
                address(this), 
                'Generate authorization code', 
                space));

        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, hashToVerify));

        
        require (prefixedHash == latestCommittedHashByAddressBySpace[space][userRegisteringSpace]);

        return userRegisteringSpace == ecrecover(prefixedHash, v, r, s);

}