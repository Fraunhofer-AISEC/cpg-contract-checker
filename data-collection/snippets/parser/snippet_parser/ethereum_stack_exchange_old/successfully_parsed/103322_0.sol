function mint(address _beneficiary, uint256 _value) public returns (bool success) {
    require( msg.sender == saleAddress || msg.sender == admin, "Sender must be saleAddress or admin.");
    balanceOf[_beneficiary] += _value;
    supply += _value;
    emit Mint(msg.sender, _beneficiary, _value);
    return true;
}