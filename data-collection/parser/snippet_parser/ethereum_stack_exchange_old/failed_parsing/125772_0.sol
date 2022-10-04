uint slippage = 100; 

function deposit(uint256 assets, address receiver) public virtual returns (uint256 shares){
    
    uint amountWithSlippage = amount + (amount / slippage); using amounts under 100 wei would make transaction revert, add an if statement to make this possible
    

}

