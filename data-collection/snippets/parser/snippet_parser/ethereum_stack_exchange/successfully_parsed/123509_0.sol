     
    function withdrawalERC (IERC20 token, address _client, uint256 _amount) private {
        require(_client != address(0), "address needs to be given");
        require(_amount > 0, "amount needs to be greater than 0");

        require(token.balanceOf(address(this)) >= _amount, "not enough token funds to send transaction");
        token.transfer(_client, _amount);
    }
     
    function batchWithdrawalERC(address token_addr, address[] calldata _clients, uint256[] calldata _amounts) external onlyOwner {
        require(_clients.length == _amounts.length, "address, amount array length need to be equal");
        require(token_addr != address(0), "invalid contract address");

        IERC20 iERC20 = IERC20(token_addr);
        for (uint16 i=0; i < _clients.length; i++) {
            withdrawalERC(iERC20, _clients[0], _amounts[0]);
        }
    }
