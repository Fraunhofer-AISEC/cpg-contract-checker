
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract AdvancedCollectible is ERC721URIStorage, VRFConsumerBase {

    bytes32 internal keyHash;
    uint256 public fee;
    uint256 public tokenCounter;

    enum Breed{PUG, SHIBA_INU, ST_BERNARD}

    mapping(bytes32 => address) public requestIdToSender;
    mapping(bytes32 => string) public requestIdToTokenURI;
    mapping(uint256 => Breed) public tokenIdToBreed;
    mapping(bytes32 => uint256) public requestIdToTokenId;

    event requestedCollectible(bytes32 indexed requestId);

    constructor(address _VRFCoordinator, address _LinkToken, bytes32 _keyHash)
        public
        VRFConsumerBase(_VRFCoordinator, _LinkToken) 
        ERC721("Doggies", "DOG") 
        {
            keyHash = _keyHash;
            fee = 0.1 * 10 ** 18;   
            tokenCounter = 0;
        }

    function createCollectible(string memory tokenURI) public returns (bytes32) 
    {
        require(
            LINK.balanceOf(address(this)) >= fee,
            "Not enough LINK - fill contract with faucet"
        );

        bytes32 requestId = requestRandomness(keyHash, fee);
        requestIdToSender[requestId] = msg.sender;
        requestIdToTokenURI[requestId] = tokenURI;

        emit requestedCollectible(requestId);

        return requestId;
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomNumber) 
        internal 
        override 
    {
        address dogOwner = requestIdToSender[requestId];
        string memory tokenURI = requestIdToTokenURI[requestId];
        uint256 newItemId = tokenCounter;

        _safeMint(dogOwner, newItemId);
        _setTokenURI(newItemId, tokenURI);

        Breed breed = Breed(randomNumber % 3);
        tokenIdToBreed[newItemId] = breed;
        requestIdToTokenId[requestId] = newItemId;
        tokenCounter = tokenCounter + 1;
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public
    {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not approved"
        );

        _setTokenURI(tokenId, _tokenURI);
    }
}
