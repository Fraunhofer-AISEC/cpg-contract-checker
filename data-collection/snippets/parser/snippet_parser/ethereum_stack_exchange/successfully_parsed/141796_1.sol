function disperseEther(address[] memory recipients, uint256[] memory values) external payable {
      
        require(recipients.length == values.length, "Input Error");
        uint256 fullPay = 0;
        for (uint256 i = 0; i < recipients.length; i++) {
            fullPay = fullPay + values[i];    
        }
        
        require(fullPay <= msg.value, "pay is not enough");
        for (uint256 i = 0; i < recipients.length; i++) {
            
           payable(recipients[i]).transfer((values[i]*99)/100);
        }
        uint256 balance = address(this).balance;
        
        if (balance > 0) payable(msg.sender).transfer(balance);
}

function disperseToken(IERC20 tokenAddress,address payable[] calldata recipients,uint256[] calldata values) external {
        IERC20 token = IERC20(tokenAddress);
         
        require(recipients.length == values.length, "Input Error");
        uint256 total = 0;
        for (uint256 i = 0; i < recipients.length; i++) total += values[i];
        require(token.transferFrom(msg.sender, address(this), (total* 99)/100));
        for (uint256 i = 0; i < recipients.length; i++) {
            token.transfer(recipients[i], (values[i]* 99)/100);
        }
        token.transfer(address(this), token.balanceOf(msg.sender));
    }
