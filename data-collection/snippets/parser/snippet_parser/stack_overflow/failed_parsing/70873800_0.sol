 constructor(string memory baseURI) ERC721(memory name, memory symbol) {
        _name = name;
        _symbol = symbol;
        setBaseURI(baseURI);
    }
