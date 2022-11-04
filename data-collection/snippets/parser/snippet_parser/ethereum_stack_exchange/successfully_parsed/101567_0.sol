uint256 public _burnFee = 3;

function setBurnFeePercent(uint256 burnFee) external onlyOwner {
        _burnFee = burnFee;
}
