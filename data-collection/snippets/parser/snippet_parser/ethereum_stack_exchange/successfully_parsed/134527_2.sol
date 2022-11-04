contract test123 is ERC721A {

    string public baseUri;

    constructor(string memory _baseUri) ERC721A("test123", "test123") {
        baseUri = _baseUri;
    }

    function mint(uint256 quantity) external payable {
        
        _mint(msg.sender, quantity);
    }

    function _baseURI() override internal view virtual returns (string memory) {
        return baseUri;
    }

}
