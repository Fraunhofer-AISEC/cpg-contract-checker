pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract AdvancedCollectible is ERC721, VRFConsumerBase {

    bytes32 internal keyHash;
    uint256 public fee;
    uint256 public tokenCounter;
    
    enum Color{BROWN, RED, BLUE}

    mapping(bytes32 => address) public requestIdToSender;
    mapping(bytes32 => string) public requestIdToTokenURI;
    mapping(uint256 => Color) public tokenIdToColor;
    mapping(bytes32 => uint256) public requestIdToTokenId;
    event requestedCollectible(bytes32 indexed requestId);

    constructor(address _VRFCoordinator, address _LinkToken, bytes32 _Keyhash) public
    VRFConsumerBase(_VRFCoordinator, _LinkToken)
    ERC721("Doggie", "DOG")
    {
       keyHash = _keyhash;
       fee = 0.1 ** 18; 
       tokenCounter = 0;
    }
    
    function createCollectible(uint256 userProvidedSeed, string memory tokenURI) 
    public returns (bytes32){
    {
        bytes32 requestId = requestRandomness(KeyHash, Fee, user);
        requestIdToSender[requestId] = msg.sender;
        requestIdToTokenURI[requestId] = tokenURI;
        emit requestedCollectible(requestID);
    }   

    function fulfillRandomness(bytes32 requestId, uint256 randomNumber) internal override {
        address dogOwner = requestIdToSender[requestId];
        string memory tokenURI = requestIdToTokenUri[requestId];
        uint256 newItemId = tokenCounter;
        _safeMint(dogOwner, newItemId);
        _setTokenURI(newItemId, tokenURI);
        Color apecolor = Color(randomNumber % 3);
        tokenIdToColor[newItemId] = apecolor
        requestIdToTokenId[requestId] = newItemId;
        tokenCounter = tokenCounter + 1;
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        returns(
            _isApprovedOrOwner(msgSender)(), tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );
        _setTokenURI(tokeId, _TokenURI)
    }
}
