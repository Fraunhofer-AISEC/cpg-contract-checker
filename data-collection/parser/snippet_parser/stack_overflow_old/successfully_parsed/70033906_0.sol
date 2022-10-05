contract FirstContract is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter public _id;

    constructor(address admin) ERC721("Token Name", "TOKEN") {
        
    }

    function incrementToken() public {
        _id.increment();
    }

    function currentToken() public view returns (uint256) {
        return _id.current();
    }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }
}
