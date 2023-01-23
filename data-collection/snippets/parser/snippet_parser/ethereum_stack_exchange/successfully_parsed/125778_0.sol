


pragma solidity ^0.6.6; 

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract createNFT is ERC721, VRFConsumerBase{

   

uint public tokenCounter;
uint public fee;
bytes32 public keyhash;
uint public TOTAL_SUPPLY = 50;
uint public randomNum;


enum Player{
    LEBRON_JAMES,
    DEVIN_BOOKER,
    MASON_PLUMLEE
}

Player public player;

mapping(bytes32 => address) public requestIdToSender;
mapping(uint => Player) public tokenToPlayer;
mapping(Player => string) public playerToTokenURI;
mapping(bytes32 => string) public requestIdToTokenURI;

event requestCollectible(bytes32 indexed requestId, address requester);
event playerAssigned(uint indexed tokenId, Player _player);
event tokenURIAssigned(Player _player, string _tokenURI);


constructor (address _vrfCoordinator, address _linkToken, uint _fee, bytes32 _keyhash) public 
VRFConsumerBase(_vrfCoordinator, _linkToken)
ERC721("Player","PLY"){
    fee = _fee;
    keyhash = _keyhash;
    tokenCounter = 0;
} 

function createCollectible() public returns(bytes32){
    bytes32 requestId = requestRandomness(keyhash, fee);
    requestIdToSender[requestId] = msg.sender;
    emit requestCollectible(requestId, msg.sender);

}

function fulfillRandomness(bytes32 requestId, uint randomness) internal override{
    require(tokenCounter <= TOTAL_SUPPLY, "Maximum number of NFTS have been minted!");

    
    uint _randomNum = randomness % 100;
    randomNum = _randomNum;
    if(randomNum < 10){
        player = Player(0);
    }

    else if(randomNum < 35){
        player = Player(1);
    }

    else{
        player = Player(2);
    }


    tokenToPlayer[tokenCounter] = player;
    emit playerAssigned(tokenCounter, player);
    string memory tokenURI = requestIdToTokenURI[requestId];
    address owner = requestIdToSender[requestId];
    _safeMint(owner, tokenCounter);
    setTokenURI(tokenCounter, tokenURI);
    tokenCounter++;
}

function setTokenURI(uint _tokenCounter, string memory _tokenURI) public{
    if(randomNum < 10){
        player = Player(0);
    }

    else if(randomNum < 35){
        player = Player(1);
    }

    else{
        player = Player(2);
    }

    playerToTokenURI[player] = _tokenURI;
    emit tokenURIAssigned(player, _tokenURI);
    _setTokenURI(_tokenCounter, _tokenURI);

}

}
