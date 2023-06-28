function verifiedMint(bytes memory data, bytes32 hash, bytes memory sig, uint256 amount) public {
     require(ECDSA.toEthSignedMessageHash(data) == hash, "Hashed data incorrect");
     require(ECDSA.recover(hash, sig) == signer, "Invalid Signer"); 
     (uint256 nonce, address receiver) = abi.decode(data, (uint256, address));
     require(receiver == msg.sender, "Address not authorised to claim"); 
     require(nonces[receiver] + 1 == nonce, "Incorrect nonce"); 
     nonces[receiver] += 1;
     _mint(receiver, amount);
}
