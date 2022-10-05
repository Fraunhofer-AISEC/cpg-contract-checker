function settlement(uint256 _amount) external returns (bool) {
   uint256 amount = _amount * 10 ** uint256(DECIMAL_FACTOR);
   require(proxy.distributeStakes(msg.sender, amount));
   
   require(this.transferFrom(msg.sender, 0x0, _amount));
   return true;
}