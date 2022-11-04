function burnERC20(uint256 _amount, address _sender, address _tokenAddress) internal returns(bool){
       IERC20 tokenContract = IERC20(_tokenAddress);
       uint8 tokenDecimals = tokenContract.decimals();
       tokenContract.allowance(msg.sender, address(this));
       require(tokenContract.balanceOf(_sender) >= _amount * 10^tokenDecimals, 'you do not have enough funds');
       bool sent = tokenContract.transferFrom(_sender, address(0), _amount);
       return sent;
     }
