
pragma solidity ^0.8.16;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

error RandomApeYachtClub__NotOwner();
error RandomApeYachtClub__BreedNotFound();
error RandomApeYachtClub__NotEnoughFeeToMint();
error RandomApeYachtClub__NotAbleToWithdraw();

contract RandomApeYachtClub is ERC721URIStorage, VRFConsumerBaseV2 {
  enum ApeBreed {
    CHIMP,
    GORILLA,
    BABOON,
    BLACK_HOWLER
  }

  
  VRFCoordinatorV2Interface immutable private COORDINATOR;
  address immutable private i_vrfCoordinator;
  bytes32 immutable private i_keyHash;
  uint32 immutable private i_callbackGasLimit;
  uint64 immutable private i_subscriptionId;
  mapping (uint256 => address) s_requestIdToMinter;

  
  uint256 constant private MAX_RARITY = 500;
  uint256 private s_tokenId;
  string[4] private s_tokenURIs;
  mapping (uint256 => string) tokenIdToTokenURI;

  uint256 private i_mintFee;
  address immutable private i_owner;

  
  event NFTRequested(uint256 requestId, address sender);
  event NFTMinted(uint256 requestId, uint256 tokenId, ApeBreed breed, address minter);

  constructor (
    address vrfCoordinator,
    bytes32 keyHash,
    uint32 callbackGasLimit,
    uint64 subscriptionId,
    string[4] memory tokenURIs,
    uint256 mintFee
  )
  ERC721("RandomApeYachtClub", "RAYC")
  VRFConsumerBaseV2(vrfCoordinator)
  {
    i_owner = msg.sender;
    COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
    i_vrfCoordinator = vrfCoordinator;
    i_keyHash = keyHash;
    i_callbackGasLimit = callbackGasLimit;
    i_subscriptionId = subscriptionId;
    s_tokenURIs = tokenURIs;
    i_mintFee = mintFee;
  }
  
  
  function mintNft() payable external returns (uint256 requestId) {
    if(msg.value < i_mintFee)
      revert RandomApeYachtClub__NotEnoughFeeToMint();

    requestId = COORDINATOR.requestRandomWords(
      i_keyHash,
      i_subscriptionId,
      3,
      i_callbackGasLimit,
      1
    );

    s_requestIdToMinter[requestId] = msg.sender;
    emit NFTRequested(requestId, msg.sender);
  }

  
  function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
    address minter = s_requestIdToMinter[requestId];
    uint256 tokenId = s_tokenId;

    uint256 randomNumber = randomWords[0] % MAX_RARITY;
    ApeBreed apeBreed = getApeFromNumber(randomNumber);
    string memory _tokenURI = s_tokenURIs[uint256(apeBreed)];
    _safeMint(minter, tokenId);
    _setTokenURI(tokenId, _tokenURI);
    tokenIdToTokenURI[tokenId] = _tokenURI;
    s_tokenId++;
    emit NFTMinted(requestId, tokenId, apeBreed, minter);
  }

  function getApeFromNumber(uint256 randomNumber) public pure returns (ApeBreed) {
    uint256[4] memory rarityChance = getRarityChance();
    uint256 accu = 0;
    for (uint i = 0; i < rarityChance.length; i++) {
      if((randomNumber >= rarityChance[i]) && (randomNumber < (rarityChance[i] + accu))) {
        return ApeBreed(i);
      }
      accu += rarityChance[i];
    }
    revert RandomApeYachtClub__BreedNotFound();
  }

  function getRarityChance() internal pure returns (uint256[4] memory) {
    return [10, 30, 120, MAX_RARITY];
  }
}
