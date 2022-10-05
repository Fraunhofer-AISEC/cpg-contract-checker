constructor(
    address payable _auctioneer,
    uint256 _startBlock,
    uint256 _endBlock,
    uint256 _bidIncrement
) {
    require(_startBlock >= _endBlock);
    require(_startBlock < block.number);
    auctioneer = _auctioneer;
    startBlock = _startBlock;
    endBlock = _endBlock;
    bidIncrement = _bidIncrement;
    auctionState = auc_State.running;
}
