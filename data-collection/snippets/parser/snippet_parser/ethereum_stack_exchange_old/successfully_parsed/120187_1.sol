function recover(uint256 amount, uint8 v, bytes32 r, bytes32 s) view external returns(address signer){

        bytes32 hash =  keccak256(abi.encodePacked(amount));
        bytes32 signedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",hash));
        signer = ecrecover(signedHash, v, r, s);

}
