function buyNft(uint256 _value) public returns (bool) {
        address sender = address(msg.sender);
        uint256 busdUserBalance = BUSD.balanceOf(sender);
        require(busdUserBalance >= _value,"not enough balance first require buyNFT");
        
        uint256 bonusPaid=0;
        bool exists = false;

        for (uint i = 0 ; i < 7 ; i++)
            if ( allowedValues[i] ==  _value ){
                exists = true;
                break;
            }

        require(exists, "Sorry NFT of that value is not available by now");

        

        BUSD.approve(address(this),_value);
        BUSD.transferFrom(sender, address(this),_value);
}
