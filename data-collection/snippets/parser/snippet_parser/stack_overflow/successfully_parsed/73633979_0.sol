




pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";

import "./VRFConsumerBaseV2.sol";

contract AdvancedCollectable is ERC721URIStorage, VRFConsumerBaseV2 {
    uint256 public tokenCounter;
    bytes32 public keyhash;
    uint256 public fee;

    uint64 public s_subscriptionId;
    uint32 public callbackGasLimit = 2500000;
    uint16 public requestConfirmations = 3;
    uint32 public numWords = 2;

    VRFCoordinatorV2Interface public COORDINATOR;
    LinkTokenInterface public LINKTOKEN;

    
    uint256[] public rnl;
    uint256 public testInt;
    uint256 public rid;

    enum Breed {
        PUG,
        SHIBA_INU,
        ST_BERNARD
    }

    mapping(uint256 => Breed) public tokenIdToBreed;
    mapping(uint256 => address) public requestIdToSender;
    event requestedCollectable(uint256 indexed requestId, address requester);
    event breedAssigned(uint256 indexed tokenId, Breed breed);

    constructor(
        address _vrfcoordinator,
        address _linktoken,
        bytes32 _keyhash,
        uint256 _fee
    ) public VRFConsumerBaseV2(_vrfcoordinator) ERC721("Dogie", "DOG") {
        tokenCounter = 0;
        keyhash = _keyhash;
        fee = _fee;
        COORDINATOR = VRFCoordinatorV2Interface(_vrfcoordinator);
        LINKTOKEN = LinkTokenInterface(_linktoken);

        createNewSubscription();
    }

    function createCollectable() public returns (uint256) {
        uint256 requestId = COORDINATOR.requestRandomWords(
            keyhash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );

        rid = requestId;

        requestIdToSender[requestId] = msg.sender;
        emit requestedCollectable(requestId, msg.sender);
    }

    function fulfillRandomWords(
        uint256 requestId,
        uint256[] memory randomNumbers
    ) internal override {
        testInt = 1;
        rnl = randomNumbers;
        Breed breed = Breed(randomNumbers[0] % 3);
        uint256 newTokenId = tokenCounter;

        tokenIdToBreed[newTokenId] = breed;
        emit breedAssigned(newTokenId, breed);

        address owner = requestIdToSender[requestId];
        _safeMint(owner, newTokenId);
        tokenCounter = tokenCounter + 1;
    }
    

    
    function createNewSubscription() private {
        s_subscriptionId = COORDINATOR.createSubscription();
        
        COORDINATOR.addConsumer(s_subscriptionId, address(this));
    }

    
    
    function topUpSubscription(uint256 amount) external {
        LINKTOKEN.transferAndCall(
            address(COORDINATOR),
            amount,
            abi.encode(s_subscriptionId)
        );
    }

    function addConsumer(address consumerAddress) external {
        
        COORDINATOR.addConsumer(s_subscriptionId, consumerAddress);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        

        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: caller is not owner or approved."
        );

        _setTokenURI(tokenId, _tokenURI);
    }
}
