contract MyNFTShop is ERC721 {

    struct NFTCardAttributes {
        uint256 cardIndex;
        string name;
        string imageURI;
    }

    NFTCardAttributes[] defaultCards;

    constructor(
        string[] memory cardNames,
        string[] memory cardImageURIs,
    ) ERC721("NFT", "NFTC") {
        for (uint256 i = 0; i < cardNames.length; i += 1) {
            defaultCards.push(
                NFTCardAttributes({
                    cardIndex: i,
                    name: cardNames[i],
                    imageURI: cardImageURIs[i],
                })
            );

            NFTCardAttributes memory c = defaultCards[i];
        }

    }


    function checkIfUserHasNFTCard() public view returns (NFTCardAttributes memory) {
        uint256 userNFTCardNftTokenId = nftCardHolders[msg.sender];
        if(userNFTCardNftTokenId > 0 ) {
            return nftCardHolderAttributes[userNFTCardNftTokenId];
        } else {
            NFTCardAttributes memory emptyStruct;
            return emptyStruct;
        }
    }


    function do_something() public () {
        if (getAllDefaultCards() == EMPTY) { <---- NEED HELP HERE
            
        }
    }
}
