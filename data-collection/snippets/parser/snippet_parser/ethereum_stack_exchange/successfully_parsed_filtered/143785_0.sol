    function mintNft() external payable{

        s_tokenCounter = s_tokenCounter + 1;
        _safeMint(msg.sender, s_tokenCounter);

        obsolescence[s_tokenCounter] = NFTInfo(1, uint32(block.timestamp));
    }
