 uint256 public totalBuyFee = 1000;
 uint256 public totalSellFee = 2200;

function getTotalFee(bool selling) public view returns (uint256) {
        if (launchedAt + 2 >= block.number){ return feeDenominator.sub(1); }
        if (selling && feeMultipliersTriggeredAt.add(feeMultipliersDuration) > block.timestamp) {return getSellFee();}
        if (!selling && feeMultipliersTriggeredAt.add(feeMultipliersDuration) > block.timestamp) {return getBuyFee();}
        if (!selling && greenwallTriggeredAt.add(greenwallDuration) > block.timestamp) {return greenwallbuyFee();}  
        return selling ? totalSellFee : totalBuyFee;
    }
    
    function greenwallbuyFee() public view returns (uint256) {
        uint256 totalFee = totalBuyFee();
        uint256 remainingTime = greenwallTriggeredAt.add(greenwallDuration).sub(block.timestamp);
        uint256 feeDecrease = totalFee.sub(totalFee.mul(greenwallNumerator).div(greenwallDenominator));
        return totalFee.sub(feeDecrease.mul(remainingTime).div(greenwallDuration)); 
}