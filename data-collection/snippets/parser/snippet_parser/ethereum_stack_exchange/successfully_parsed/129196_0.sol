uint256 transferFee = 88000000000000020; 
 
  function _afterTokenTransfer(
    address from,
    address to,
    uint256 amount
) internal override {

    super._afterTokenTransfer(from, to, amount);
    uint256 feeAmount = (amount / 10**18) * transferFee;

    approve(address(this), feeAmount);
    transferFrom(to, address(this), feeAmount);
    
    
}
