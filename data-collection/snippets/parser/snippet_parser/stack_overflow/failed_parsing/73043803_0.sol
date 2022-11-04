mapping(address => mapping(uint => uint8) public handledNfts;

mapping(bytes32 => uint8) public usedHashes;

function create(address contractAddress, uint tokenId, bytes32 hash) external
{
    uint8 vCheck = usedHashes[hash];

    require(vCheck!=1, "Bad hash");    

    usedHashes[ hash ] = 1;

    uint8 vCheck = handledNfts[contractAddress][tokenId];
    
    require(vCheck!=1, "Already created");    

    handledNfts[contractAddress][tokenId] = 1;



    
}
