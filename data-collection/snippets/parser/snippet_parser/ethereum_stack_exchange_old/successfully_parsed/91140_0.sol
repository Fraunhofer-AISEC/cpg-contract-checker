function convertRTKIntoRTKLX(address to, uint256 amount, uint256 X) public returns (bool) {
    require (
        (X >= 2 && X <= 5), 
        "Invalid value of X. X can only be 2, 3, 4, 5"
    );
    
    require (
        amount > 0,
        "Cannot convert 0"
    );
    
    ERC20 AMMOToken = ERC20(_Token_AMMO);
    ERC20 RTKToken = ERC20(_Token_RTKL[0]);
    ERC20 RTKLXToken = ERC20(_Token_RTKL[X-1]);
    
    require (
        RTKLXToken.balanceOf(address(this)) >= amount,
        "Insufficeint RTKLX Token balance in the contract for the given value of X"
    );
    
    require (
        RTKToken.allowance(msg.sender, address(this)) >= amount,
        "Allowance Lower than required for RTKToken"
    );
    
    require (
        AMMOToken.allowance(msg.sender, address(this)) >= ((X-1)*amount),
        "Allowance Lower than required for bulletToken"
    );
    

    if(AMMOToken.transferFrom(msg.sender, address(this), ((X-1)*amount))) {
        if(RTKToken.transferFrom(msg.sender, address(this), amount)) {
            if(RTKLXToken.transfer(to, amount)) {
                _RTKLX_ExtCirculation[X-1] += amount;
                return true;
            } else {
                return false;
            }
        } else {
            AMMOToken.transfer(msg.sender, (X-1)*amount);
            return false;
        }
    } else {
        return false;
    }
}
