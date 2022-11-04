function testCanBuyListing() public {
        uint256 userBalance = address(this).balance;
        nft.transferFrom(address(this), user, nftId);

        uint256 listingId = opensea.list(nft, nftId, 1 ether);

        vm.prank(user);
        opensea.buyListing{value: 1 ether}(listingId);
    }
