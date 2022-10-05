contract MyNFT is ERC721Enumerable, PaymentSplitter, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
...

function mint(uint256 _count)
        public payable
{
    uint256 tokenId = currentTokenId.current();
    require(tokenId < MAX_SUPPLY, "Max supply reached");
    for(uint i = 0; i < _count; ++i){
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(msg.sender, newItemId);
    }
}
}
