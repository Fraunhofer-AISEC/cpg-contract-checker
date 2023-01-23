    
    function create(uint256 _initialSupply, string memory _uri) public {
        _uris[lastId.current()] = _uri;
        creators[lastId.current()] = msg.sender;
        _mint(msg.sender, lastId.current(), _initialSupply, "");
        emit ArticleMinted(msg.sender, _uri, lastId.current(), _initialSupply);
        lastId.increment();
    }
