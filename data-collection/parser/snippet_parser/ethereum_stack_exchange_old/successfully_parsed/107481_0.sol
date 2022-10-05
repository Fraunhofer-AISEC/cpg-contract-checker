function swap(uint256 amount, address destination) private {
    uint256 bnbBalance = address(this).balance;
    uint256 prizePool = _calculatePercentage(amount, percentage_prize_pool);

    
    amount = amount.sub(prizePool);
    
    
    

    
    uint256 bnbPrizePool = xxxxxx;
    payable(prize_pool_wallet).transfer(bnbPrizePool);
}
