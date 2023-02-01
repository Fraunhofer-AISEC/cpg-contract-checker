     function generateCharacter(uint256 tokenId) public view returns(string memory){
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            '<style>.base { fill: white; font-family: sans-serif; font-weight:700; font-size: 54px; }</style>,',
            '<image xlink:href="https://ipfs.filebase.io/ipfs/QmRXzJVjKnWp1ZULdhePPuT8rY2BksFrUf5qKed7aWANSz" />,',
            '<text x="70%" y="10%" class="base" dominant-baseline="middle" text-anchor="left">Days: ',getLevels(tokenId),'</text>,',
            '</svg>'
        );
        return string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(svg)
            )    
        );
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory){
        bytes memory dataURI = abi.encodePacked(
            '{', 
                '"description": "This is an accountability token for staying focused on better mental and physical health.",',
                '"external_url": "mattburnell.com/mbnftforge",',
                '"image": "', generateCharacter(tokenId), '"',
                '"name": "Forge Accountability NFT",', 
                '"attributes": [',
                    '{',
                    '"trait_type": "Days On Task",',
                    '"value": "',getLevels(tokenId),' days!"',
                    '}]',
            '}'
        );
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    } 
