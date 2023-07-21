pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract MyNFT is VRFConsumerBase {
    uint256 public tokenIdCounter;
    enum MetadataChoices { Choice1, Choice2, Choice3 }

    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomResult;

    mapping(bytes32 => address) public requestIdToSender;
    mapping(bytes32 => uint256) public requestIdToTokenId;
    mapping(uint256 => string) public tokenIdToMetadata;

    event requestedRandomness(bytes32 requestId);

    constructor(address vrfCoordinator, address link, bytes32 _keyHash, uint256 _fee) 
        VRFConsumerBase(vrfCoordinator, link) {
        keyHash = _keyHash;
        fee = _fee;
        metadataChoices.push(MetadataChoices.Choice1);
        metadataChoices.push(MetadataChoices.Choice2);
        metadataChoices.push(MetadataChoices.Choice3);
    }

    function requestRandomNumber(uint256 tokenId) external returns (bytes32) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK to fulfill request");
        bytes32 requestId = requestRandomness(keyHash, fee);
        requestIdToSender[requestId] = msg.sender;
        requestIdToTokenId[requestId] = tokenId;
        emit requestedRandomness(requestId);
        return requestId;
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        address sender = requestIdToSender[requestId];
        uint256 tokenId = requestIdToTokenId[requestId];
        uint256 index = randomness % metadataChoices.length;
        tokenIdToMetadata[tokenId] = _metadataForChoice(metadataChoices[index]);
        randomResult = randomness;
        _safeMint(sender, tokenId);
    }
}

