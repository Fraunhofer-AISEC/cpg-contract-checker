function getMessageHash(address add,uint256 amount,uint256 nonce ) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(add,amount,nonce)); 
}
