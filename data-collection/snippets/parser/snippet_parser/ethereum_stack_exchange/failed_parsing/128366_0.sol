    struct CryptoGift {
    address from;
    address to;
    uint256 tokenId;
    dateToTransfereGift;
}

mapping(address => CryptoGift) public gifts;

function setGiftRecipient(address _to, uint256 _tokenId) public payable {
    gifts[msg.sender] = CryptoGift(msg.sender, _to, _tokenId, block.timestamp +60 );
}
