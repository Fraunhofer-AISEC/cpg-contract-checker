function withdraw() external payable {
        address _caller = msg.sender;
        uint256 _userBalance = recipientBalances[_caller];

        if (isExpired() && _userBalance > 0) {
            uint256 _contractBalance = address(this).balance;
            recipientBalances[_caller] = 0;
            address payable _recipient = payable(_caller);
            if (_contractBalance > _userBalance) {
                _recipient.transfer(etherToWei(_userBalance));
            }
        }
    }
