function _sell(uint256 tokenAmount, address recipient) internal {
require(tokenAmount > 0 && _balances[msg.sender] >= tokenAmount);

uint256 oldPrice = _calculatePrice();

bool takeFee = !isFeeExempt[msg.sender];


uint256 tokensToSwap = takeFee
    ? tokenAmount.mul(sellFee).div(feeDenominator)
    : tokenAmount.sub(100, "100 Asset Minimum For Fee Exemption");


uint256 amountUnderlyingAsset = (tokensToSwap.mul(oldPrice)).div(
    precision
);

require(
    amountUnderlyingAsset > 0,
    "Zero Assets To Redeem For Given Value"
);


_burn(msg.sender, tokenAmount);

if (takeFee) {
    
    uint256 taxTaken = tokenAmount.sub(tokensToSwap);
    
    uint256 allocation = taxTaken.mul(devShare).div(
        devShare.add(liquidityShare)
    );
    
    _mint(dev, allocation);
}


bool successful = IERC20(_underlying).transfer(
    recipient,
    amountUnderlyingAsset
);

require(successful, "Underlying Asset Transfer Failure");

_requirePriceRises(oldPrice);

emit TokenSold(tokenAmount, amountUnderlyingAsset, recipient);
