function send_ETH(address payable recipient) payable public {
    
    uint256 minimumUSD = 0.01 * 1e18;
    require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");
    
    this.invest(msg.value);
    this.fund(recipient);
}

   function invest() internal{
        

        recordTransaction(address(this), amount, false);
        recordTransaction(owner, amount, true);
    }
