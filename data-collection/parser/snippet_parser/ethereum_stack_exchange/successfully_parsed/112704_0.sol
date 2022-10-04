function mint(bytes32 hash) external {
        require(!_hasMinted[msg.sender]);
        require(totalSupply() + premineRemaining < 500);
        require(hash == sha256(abi.encodePacked(msg.sender, "emperor")));
        
}
