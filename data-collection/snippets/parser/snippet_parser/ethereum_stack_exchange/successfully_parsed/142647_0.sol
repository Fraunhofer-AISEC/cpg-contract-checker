bytes32 public merkleRoot;

    constructor(bytes32 merkleRoot_) ERC721('Excited Ape Yacht Club', 'EAYC') {
        merkleRoot = merkleRoot_;
    }

    function mint(uint256 quantity, bytes32[] calldata merkleProof) public {
        bytes32 node = keccak256(abi.encodePacked(msg.sender, quantity));
        require(MerkleProof.verify(merkleProof, merkleRoot, node), 'invalid proof');

        for (uint256 i = 0; i < quantity; i++) {
            uint256 tokenId = _tokenIds.current();
            _mint(msg.sender, tokenId);

            _tokenIds.increment();
        }
    }
