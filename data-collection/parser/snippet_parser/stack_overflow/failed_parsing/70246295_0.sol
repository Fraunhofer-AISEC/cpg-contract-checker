pragma solidity >=0.7.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract Sofb is ERC721Enumerable, Ownable, VRFConsumerBase {
using Strings for uint256;

string baseURI;
string public baseExtension = ".json";
uint256 public cost = 0.015 ether;
uint256 public maxSupply = 7070;
uint256 public tokenCounter;
bool public paused = false;
bool public revealed = false;
string public notRevealedUri;
bytes32 internal keyHash;
uint256 internal fee;
uint256 public randomResult = 0;
address payable giftAddress = payable(msg.sender);
uint256 giftValue = 0;

mapping(bytes32 => uint256) public requestIdToRandomNumber;
mapping(bytes32 => address) public requestIdToAddress;
mapping(bytes32 => uint256) public requestIdToRequestNumberIndex;
uint256 public requestCounter;  

constructor(string memory _name, string memory _symbol, string memory _initBaseURI, string memory _initNotRevealedUri, address _vrfCoordinator, address _linkToken, bytes32 _keyHash, uint256 _fee) 
    VRFConsumerBase(_vrfCoordinator, _linkToken)
    
    ERC721(_name, _symbol) {
        setBaseURI(_initBaseURI);
        setNotRevealedURI(_initNotRevealedUri);
        keyHash = _keyHash;
        fee = _fee;
    }

function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
}



function getRandomNumber() public returns (bytes32 requestId) { 
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    requestIdToAddress[requestId] = msg.sender;
    requestIdToRequestNumberIndex[requestId] = requestCounter;
    requestCounter += 1;
    return requestRandomness(keyHash, fee);
}

function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
    requestIdToRandomNumber[requestId] = randomness;
    uint256 requestNumber = requestIdToRequestNumberIndex[requestId];
}

function mint() public payable {
    uint256 supply = totalSupply();
    require(!paused);
    require(supply + 1 <= maxSupply);
    require(msg.value >= cost);

    if (msg.sender != owner()) {
        require(msg.value >= cost);
    }

    if (supply > 0) {
        require(randomResult > 0);
        giftAddress = payable(ownerOf(randomResult));
        giftValue = ((supply + 1 == 5) || (supply + 1 == 10)) ? address(this).balance * 1 / 100 : msg.value * 10 / 100;
        (bool success, ) = payable(giftAddress).call{value: giftValue}("");
        require(success);
    }

    _safeMint(msg.sender, supply + 1);

    getRandomNumber();
 }
 ...
}
