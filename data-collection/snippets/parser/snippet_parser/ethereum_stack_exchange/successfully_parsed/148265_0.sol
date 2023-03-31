function _transferFrom(address sender, address recipient, uint256 amount) internal returns (bool) {
        if (!tradingOpen) {
            require (sender == owner ||  sender == address (this));
            return _basicTransfer(sender, recipient, amount);
        }
}
