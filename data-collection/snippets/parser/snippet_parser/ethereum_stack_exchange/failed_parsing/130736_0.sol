    function mint(uint256 _mintAmount, bytes32[] calldata merkleProof) public payable isValidMerkleProof(merkleProof, whitelistMerkleRoot) {
        require(!paused, 'Contract is paused');
        uint256 supply = totalSupply();
        require(totalSupply() + _mintAmount <= maxSupply, 'Supply minted');
        require(_mintAmount > 0, 'You have to mint at least one');
        require(_mintAmount <= maxMintAmount, 'You can mint up to 3');

        if (msg.sender != owner()) {
            uint256 senderMintCount = addressMintedBalance[msg.sender];
            require(senderMintCount + _mintAmount <= nftPerAddressLimit, "cannot mint more than 3");
        }

        for (uint256 i = 1; i <= _mintAmount; i++) {
            addressMintedBalance[msg.sender]++;
            _safeMint(msg.sender, supply + i);
        }

    }

    
    
    modifier isValidMerkleProof(bytes32[] calldata merkleProof, bytes32 root) {
        if(msg.sender != owner()){
            require(MerkleProof.verify(merkleProof, root, keccak256(abi.encodePacked(msg.sender))), "Address does not exist in list");
        }
        _;
    }
