    function reveal(
        uint _id
    )
    public
    payable
    {
        ProductWithBids storage selectedProduct = internalProducts[_id];
        
        require(block.timestamp > selectedProduct.biddingEnd);
        require(block.timestamp < selectedProduct.revealEnd);
        uint count = selectedProduct.bidsCount;

        uint[] memory values = new uint[](count);
        bool[] memory fake = new bool[](count);
        string[] memory secret = new string[](count);

        for (uint i = 0; i < count; i++) {
            values[i] = selectedProduct.nakedBids[msg.sender][i].values;
            fake[i] = selectedProduct.nakedBids[msg.sender][i].fake;
            secret[i] = selectedProduct.nakedBids[msg.sender][i].secret;
        }

        revealInternal(
            values,
            fake,
            secret,
            _id
        );
    }

