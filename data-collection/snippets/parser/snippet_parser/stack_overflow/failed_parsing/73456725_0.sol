


function isPrivateListed(
        uint256 _addressReservedTokens,
        bytes32[] memory _proof
    ) public view returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, _addressReservedTokens);
        return MerkleProof.verify(_proof, privateListRoot, leaf);
    }





    function privateMint(
        uint256 _mintAmount,
        uint256 _addressReservedTokens,
        bytes32[] calldata proof
    ) public payable {
        require(privateOpen, "The private mint is not opened");
        require(
            isPrivateListed(_addressReservedTokens, proof),
            "you are not in the private list"
        );
        uint256 supply = totalSupply();
        require(supply + _mintAmount <= maxSupply, "max NFT limit exceeded");

        uint256 owned = addressMintedBalance[msg.sender];
        require(
            owned + _mintAmount <= _addressReservedTokens,
            "You have less nft reserved"
        );

        for (uint256 i = 1; i <= _mintAmount; i++) {
            _safeMint(msg.sender, supply + i);
            addressMintedBalance[msg.sender]++;
        }
    }
