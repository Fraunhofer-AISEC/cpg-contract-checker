BiddingStructs[] public biddingStructs;

function getBiddingCount() public view returns(uint count) {
    return biddingStructs.length;
}
