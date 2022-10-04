function getMessageHash(address _signer, uint _amount, uint _id) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_signer, _amount, _id));
} 
