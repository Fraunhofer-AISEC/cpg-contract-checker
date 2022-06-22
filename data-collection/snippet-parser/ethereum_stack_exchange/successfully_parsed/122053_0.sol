function upvotePost(address nftContract) public payable {
    NFT nftcontract = NFT(nftContract);
    require(msg.value >= upvoteFee, 'Did not pay full upvote fee');
    nftcontract.upvoteIncrement();
    uint256 shareholderLength = nftcontract.getShareholderLength();
    uint256 shareholderIndex = shareholderLength - 1;
    nftcontract.shareholders(shareholderIndex) = msg.sender;
  }
