constructor(
    uint _biddingTime,
    address payable _beneficiary
) public {
    beneficiary = _beneficiary;
    auctionEndTime = now + _biddingTime;
}
