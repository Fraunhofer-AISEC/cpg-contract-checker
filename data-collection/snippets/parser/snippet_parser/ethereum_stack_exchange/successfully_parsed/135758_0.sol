function listItemForFixedPrice(uint256 _tokenId, uint256 _amount , uint256 _price , uint256 _royaltyFee, address _nftAddress , address _royaltyRec)public  OnlyTokenHolders(_tokenId , _nftAddress) returns(uint256)
    {
        require(_tokenId >= 0 , "TokenId can not be negative integer");
        require(_amount > 0 , "amount of nfts can not be zero");
        require(_price > 0.0001 ether  , "Price should be greater than 10 ether");
        require(_nftAddress != address(0), "NFT address cannot be 0x0000000000000000000000");
        require(_royaltyFee <= 2000 && _royaltyFee >= 150 , "Royalties fee can not be greater than 20% ");


        uint256 newItemId = Fixedprices.length;
        Fixedprices.push(FixedPrice(false,true,msg.sender,address(0),_nftAddress, _royaltyRec,_price,0,newItemId,_tokenId,_royaltyFee,_amount));
        IERC1155(_nftAddress).safeTransferFrom(msg.sender,address(this), _tokenId, _amount, "0x00");    

        emit OfferSale(newItemId);
        return newItemId;   
    }
