 function claimRewards() public {
        uint256 howMany = calculateRewards(msg.sender);
        if (howMany > 0) {
            
            uint256 walletBalance = rdk.balanceOf(address(this));

            emit Log(walletBalance, howMany);

            require (walletBalance >= howMany, "empty wallet");

            
            rdk.transferFrom(address(this), msg.sender, howMany); 
        }
}
