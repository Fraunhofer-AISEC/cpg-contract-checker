modifier onlyAdmin(){
    require(msg.sender == admin, "only an admin may access this method");
    _;
}

modifier nonZeroBalance(){
    require(tokenContract.balanceOf(address(this)) > 0 wei, "contract requires a non-zero balance to execute");
    _;
}

function endSale() public onlyAdmin nonZeroBalance {
    
    
    
    
    
    
    uint256 previousBalance = address(this).balance;
    
    msg.sender.transfer(previousBalance);
    
    
    
    
    
}
