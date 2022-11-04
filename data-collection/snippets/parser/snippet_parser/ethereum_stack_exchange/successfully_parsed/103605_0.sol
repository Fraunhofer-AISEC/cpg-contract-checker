    
    
    function approveToken(uint amount) public payable {
        token.increaseAllowance(address(this), amount);
    }
    
    
    function sendToken(uint amount) public payable {
        token.transferFrom(msg.sender, address(this), amount);
    }
    
    
    function getTokenBalance() public view returns(uint256) {
        return token.balanceOf(msg.sender);
    } 
    
    
    function getTokenAllowance() public view returns(uint256) {
        return token.allowance(msg.sender, address(this));
    }
