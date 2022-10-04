pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract AdvancedCollectible is ERC721, VRFConsumerBase {
    
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public tokenCounter;

    enum Color {Red, Blue, Green}
    
    mapping(bytes32 => address) public requestIdToSender;
    mapping(bytes32 => string) public requestIdToTokenURI;
    mapping(uint256 => Color) public tokenIdToColor;
    mapping(bytes32 => uint256) public requestIdToTokenId;
    event requestedCollectible(bytes32 indexed requestId); 

    constructor(address _VRFCoordinator, address _LinkToken, bytes32 _keyhash) public {
    VRFConsumerBase(_VRFCoordinator, _LinkToken);
    ERC721("Snails", "SNAIL");
        {
            keyHash = _keyhash;
            fee = 0.1 * 10**18; 
            tokenCounter = 0;
        }
        function createCollectible(uint256 userProvidedSeed, string memory tokenURI)
        public returns (bytes32)
        {
            bytes32 requestID = requestRandomness(keyhash, fee, userProvidedSeed);
            requestIdToSender[requestId] = msg.sender;
            requestIdToTokenURI [requestId] = tokenURI;
            emit requestedCollectible(requestId);
        }

        function fulfillRandomness(bytes32 requestID, uint256 randomNumber) internal override{
            address snailOwner = requestIdToSender[requestID];
            string memory tokenURI = requestIdToTokenURI[requestId];
            uint256 newItemId = tokenCounter; 
            _safeMint(snailOwner, newItemId);
            setTokenURI(newItemID, tokenURI);
            Color color = Color(randomNumber % 3);
            tokenIDToColor[newItemId] = color;
            requestIdToTokenId[requestID] = newItemId;
            tokenCounter = tokenCounter + 1; 
            }
    }
