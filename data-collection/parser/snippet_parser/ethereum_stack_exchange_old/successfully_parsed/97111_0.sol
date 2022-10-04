contract SoftMinter is Ownable {
    
    
    mapping(address => mapping(bytes32 => bool)) public registeredHashes;
    mapping(uint256 => bool) public alreadyMinted;

    CanMint private _nftContract;

    constructor(CanMint nftContract) public {
        _nftContract = nftContract;
    }

    function mint(
        address to,
        uint256[] memory ids,
        uint256 indexToMint
    ) public {
        require(
            registeredHashes[to][keccak256(abi.encode(to, ids))],
            "Hash not registered"
        );
        require(!alreadyMinted[ids[indexToMint]], "Already minted");
        if (registeredHashes[to][keccak256(abi.encode(to, ids))]) {
            alreadyMinted[ids[indexToMint]] = true;
            _nftContract.mint(to, ids[indexToMint]);
        }
    }

    
    function addHash(address to, bytes32 dataHash) public onlyOwner {
        require(!registeredHashes[to][dataHash], "Hash already registered");
        registeredHashes[to][dataHash] = true;
    }
}
