    function setTokenURI(uint256 tokenid, string memory uri) public {
        require(bytes(uri).length != 0, "Cannot set an empty URI");
        _setTokenURI(tokenid, uri);
    }
