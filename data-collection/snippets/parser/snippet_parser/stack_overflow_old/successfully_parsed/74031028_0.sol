

pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";


contract AdvancedCollectible is ERC721, VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface immutable COORDINATOR;
    LinkTokenInterface immutable LINKTOKEN;

    uint256 public tokenCounter;
    uint64 immutable s_subscriptionId;

    
    
    
    bytes32 immutable s_keyhash;
    uint32 immutable s_numWords = 1;
    uint16 immutable s_requestConfirmations = 3;

    
    
    
    
    
    
    uint32 immutable s_callbackGasLimit = 100000;
    uint256 public s_requestId;
    uint256 public s_randomWords;
    address s_owner;
    enum Breed {
        PUG,
        SHIBA_INU,
        ST_BERNARD
    }
    mapping(uint256 => Breed) public tokenIdToBreed;
    mapping(uint256 => address) public requestIdToSender;
    event requestCollectible(uint256 indexed requestId, address requester);
    event breedAssigned(uint256 tokenId, Breed breed);

    constructor(
        address vrfCoordinator,
        address link,
        bytes32 keyhash,
        uint64 subscriptionId
    ) VRFConsumerBaseV2(vrfCoordinator) ERC721("Dogie", "DOG") {
        tokenCounter = 0;
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        LINKTOKEN = LinkTokenInterface(link);
        s_keyhash = keyhash;
        s_owner = msg.sender;
        s_subscriptionId = subscriptionId;
    }

    modifier onlyOwner() {
        require(msg.sender == s_owner, "You are not the owner");
        _;
    }

    function createCollectible() public returns (uint256) {
        s_requestId = COORDINATOR.requestRandomWords(
            s_keyhash,
            s_subscriptionId,
            s_requestConfirmations,
            s_callbackGasLimit,
            s_numWords
        );
        requestIdToSender[s_requestId] = msg.sender;
        emit requestCollectible(s_requestId, msg.sender);
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
        internal
        override
    {
        s_randomWords = randomWords[0];
        Breed breed = Breed(s_randomWords % 3);
        uint256 newTokenId = tokenCounter;
        tokenIdToBreed[newTokenId] = breed;
        emit breedAssigned(newTokenId, breed);
        address owner = requestIdToSender[requestId];
        _safeMint(owner, newTokenId);
        tokenCounter++;
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: Caller is not owner nor approved."
        );
        setTokenURI(tokenId, _tokenURI);
    }
}
