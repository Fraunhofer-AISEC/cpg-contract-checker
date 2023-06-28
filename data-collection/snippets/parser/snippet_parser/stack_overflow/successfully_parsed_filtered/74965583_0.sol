 bytes32 public keyHash;
    uint256 public fee = 0.005 * 10 ** 18; 
    
    mapping(bytes32 => address) public requestIdToSender;
    mapping(bytes32 => string) public requestIdToName;
    Character[] public characters;
    
    uint256 public maxTokens;
    
    string  baseURI;

    uint256 costMintFee = 0.001 ether;
