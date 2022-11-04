function acceptBid(uint256 _offerId) public nonReentrant {
Offer storage offer = offers[_offerId];

IERC20 weth = IERC20(0xc778417E063141139Fce010982780140Aa0cD5Ab);
IERC721 nftContract = IERC721(offer.nftContractAddress);

address nftOwner = nftContract.ownerOf(offer.tokenId);

offer.isAccepted = true; 
weth.transferFrom(
    address(offer.userAddress),
    payable(msg.sender),
    offer.price
); 

nftContract.transferFrom(
    address(this),
    offer.userAddress,
    offer.tokenId
); 

emit AcceptedOffer();}
