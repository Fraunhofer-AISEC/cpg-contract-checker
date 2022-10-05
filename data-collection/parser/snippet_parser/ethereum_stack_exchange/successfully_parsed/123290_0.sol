function ownerWithdraw(uint256 index, address to) public payable {
        Bid memory bid = _bids[index];
        require(bid.value > 0, 'Bid value cannot be zero');
        require(bid.accepted == true, 'Bid is not accepted');
        require(bid.sent == false, 'Cannot withdraw sent bid');
        require(address(this).balance >= bid.value, 'Not enough founds');

        (bool success, ) = payable(to).call{value: bid.value}("");
        require(success, 'Bid cannot be payed');
    }
