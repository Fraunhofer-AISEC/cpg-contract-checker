uint256 days_since_start = (block.timestamp - launchedAt) / 1 days;

if(days_since_start > 0 &&

days_since_start < 10) {

_sellLiquidityFee = _initialSellLiquidityFee;

_sellBuybackFee = _initialSellBuybackFee - days_since_start;

_sellMarketingFee = _initialSellMarketingFee - days_since_start;

_sellTotalFee = _sellMarketingFee + _sellLiquidityFee + _sellBuybackFee;
