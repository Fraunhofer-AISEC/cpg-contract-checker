mapping(address=>bool) addr_bool;

function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

       if(addr_bool[msg.sender] == true) {
            return URI_1;
            
        }
          else {
            return URI_2;
        }
         

        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }

        return
            string(abi.encodePacked(base, tokenId.toString(), baseExtension));
    }
