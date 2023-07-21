
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@api3/airnode-protocol/contracts/rrp/requesters/RrpRequesterV0.sol";

contract RandomSurfaceReachT1 is ERC721URIStorage, Ownable, RrpRequesterV0 {
    uint256 public tokenCounter;
    enum Classifier{FIRST, SECOND, THIRD}
    mapping(uint256 => Classifier) public tokenIdToClassifier;
    mapping(bytes32 => string) public requestIdToTokenURI;

    address public airnode;
    bytes32 public endpointId;
    address public sponsorWallet;

    mapping(bytes32 => bool) expectingRequestIdToBeFulfilled;
    mapping(bytes32 => address) requestToRequester;
    mapping(bytes32 => string) requestToName;
    event ReturnedSurfaceReachT1(bytes32 indexed requestId, uint256 randomNumber);


    constructor(address _airnodeRrp) RrpRequesterV0(_airnodeRrp) ERC721("SURFACE REACHT1 NFT", "SURFACE REACHT1 NFT"){
        tokenCounter = 0;
    }

    function setRequestParameters(
        address _airnode,
        bytes32 _endpointId,
        address _sponsorWallet
    ) external onlyOwner {
        airnode = _airnode;
        endpointId = _endpointId;
        sponsorWallet = _sponsorWallet;
    }

    
    function requestRandomSurfaceReachT1() public returns (bytes32) {
        bytes32 requestId = airnodeRrp.makeFullRequest(
            airnode,
            endpointId,
            address(this),
            sponsorWallet,
            address(this),
            this.mintSurfaceReacher.selector,
            ""
        );
        expectingRequestIdToBeFulfilled[requestId] = true;
        requestToRequester[requestId] = msg.sender;
        return requestId;
    }

    
    function mintSurfaceReacher(bytes32 requestId, bytes calldata data) public {
        require(
            expectingRequestIdToBeFulfilled[requestId],
            "Request not awaiting fullfillment"
        );
        expectingRequestIdToBeFulfilled[requestId] = false;
        uint256 newId = tokenCounter;
        uint256 randomNumber = abi.decode(data, (uint256));
        string memory tokenURI = requestIdToTokenURI[requestId];
        _safeMint(requestToRequester[requestId], newId);
        _setTokenURI(newId, tokenURI);
        Classifier classifier = Classifier(randomNumber % 3);
        tokenIdToClassifier[newId] = classifier;
        tokenCounter = tokenCounter + 1;
        emit ReturnedSurfaceReachT1(requestId, randomNumber);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );
        _setTokenURI(tokenId, _tokenURI);
    }
}  
