contract HoldNFT is ERC721, IERC721Receiver, ERC721Holder, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIDs;
    constructor() ERC721("HoldNFT", "HOLDNFT") {
        _tokenIDs.increment();
    }
    function send(IERC721 tokenAddress, uint256 tokenId) public {
        uint256 current = _tokenIDs.current();
        tokenAddress.safeTransferFrom(msg.sender, address(this), tokenId); 
        _safeMint(recipient, current);
        _tokenIDs.increment();  
    }
}
