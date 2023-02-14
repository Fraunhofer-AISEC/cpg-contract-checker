    contract EzAsPyNews is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 public mintRate= 1.00 ether;

    constructor() ERC721("EzAsPyNews", "EAPN") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmdCg91nxaT6Rp2itU8k4jNYaCpNqxFd3fvchVdQsZKvzx#";
    }

    function safeMint(address to) public payable returns(uint256){
        require(msg.value >= mintRate, "Please make sure you are entering atleast one ether.");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        return tokenId;
        
  ''  }



