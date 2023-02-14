    contract CutoutAuctionsBase { 
    
        ERC721 public nonFungibleContract;
        
        address payable contractOwner;
    
        uint256 public ownerCut;
    
        struct Auction {
    
            address payable seller;
    
            uint128 startingPrice;
    
            uint128 endingPrice;
    
    
            uint64 startedAt;
        }
    
       
        mapping (uint256 => Auction) tokenIdToAuction;
    
    }

    constructor(){

            
            contractOwner = payable(msg.sender);

    }

    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
    return (nonFungibleContract.ownerOf(_tokenId) == _claimant);
    }

    function _escrow(address _owner, uint256 _tokenId) internal {
    nonFungibleContract.transferFrom(_owner, address(this), _tokenId);
    }

    function _transfer(address _receiver, uint256 _tokenId) internal {
          nonFungibleContract.transferFrom(address(this), _receiver, _tokenId);
    }

    function _addAuction(uint256 _tokenId, Auction memory _auction) internal {

    require(_auction.duration >= 1 minutes);
    tokenIdToAuction[_tokenId] = _auction;
    emit AuctionCreated(
        uint256(_tokenId),
        uint256(_auction.startingPrice),
        uint256(_auction.endingPrice),
        uint256(_auction.duration)
    );
}


        function _cancelAuction(uint256 _tokenId, address _seller) internal {
        _removeAuction(_tokenId);
        _transfer(_seller, _tokenId);
        emit AuctionCancelled(_tokenId);
    }


        function _bid(uint256 _tokenId, uint256 _bidAmount)
        internal
        returns (uint256)
    {


        require(_isOnAuction(auction));


        uint256 price = _currentPrice(auction);
        require(_bidAmount >= price);


        address payable seller = auction.seller;

        _removeAuction(_tokenId);


        if (price > 0) {



            uint256 auctioneerCut = _computeCut(price);
            uint256 sellerProceeds = price - auctioneerCut;


            seller.transfer(sellerProceeds);
        }


        uint256 bidExcess = _bidAmount - price;

        emit AuctionSuccessful(_tokenId, price, msg.sender);

        return price;
    }



    function _isOnAuction(Auction storage _auction) internal view returns (bool) {
        return (_auction.startedAt > 0);
    }


    
    function _currentPrice(Auction storage _auction)
        internal
        view
        returns (uint256)
    {
        uint256 secondsPassed = 0;


        if (block.timestamp > _auction.startedAt) {
            secondsPassed = block.timestamp - _auction.startedAt;
        }

        return _computeCurrentPrice(
            _auction.startingPrice,
            _auction.endingPrice,
            _auction.duration,
            secondsPassed
        );
    }



    function _computeCurrentPrice(
        uint256 _startingPrice,
        uint256 _endingPrice,
        uint256 _duration,
        uint256 _secondsPassed
    )
        internal
        pure
        returns (uint256)
    {

        if (_secondsPassed >= _duration) {



            return _endingPrice;

        } else {


            int256 totalPriceChange = int256(_endingPrice) - int256(_startingPrice);



            int256 currentPriceChange = totalPriceChange * int256(_secondsPassed) / int256(_duration);


            return uint256(currentPrice);
        }
    }
