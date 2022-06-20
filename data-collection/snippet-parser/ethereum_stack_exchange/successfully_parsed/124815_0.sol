    function mint(string memory _linkURL) public payable returns (uint) {
        uint256 supply = totalSupply();
        uint256 tokenID = supply + 1;

        if (msg.sender != owner()) {
            require(msg.value >= cost);
        }

        emit Logging(_linkURL);
        setLinkURL(_linkURL);

        _safeMint(msg.sender, tokenID);

        return tokenID;
    }
