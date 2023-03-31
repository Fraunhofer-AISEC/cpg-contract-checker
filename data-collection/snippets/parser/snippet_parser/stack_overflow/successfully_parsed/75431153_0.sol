    function claimFreeNFTs (uint[] memory _IDlist) external payable noReentrant {

        IERC721 OGcontract = IERC721(ERC721_contract);
        uint numClaims = 0; 

        for (uint i = 0; i < _IDlist.length; i++) {

            uint thisID = _IDlist[i];

            require(OGcontract.ownerOf(thisID)==msg.sender, 'Must own token.' );

            if ( !claimedIDList(thisID) ) {   

                claimIDset(thisID);  
                numClaims++;

            }

        }

        if ( numClaims > 0 ) {

            _safeMint(msg.sender, numClaims);
            emit Mint(msg.sender, totalSupply()); 
  
        } 

    }
