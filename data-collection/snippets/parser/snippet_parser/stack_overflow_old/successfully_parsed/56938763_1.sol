        function approveAndCall(address _spender, uint256 _value, bytes memory _extraData)
        public returns(bool success)
        {
            tokenRecipient spender = tokenRecipient(_spender);
            if (approve(_spender, _value)) {
                 spender.receiveApproval(msg.sender, _value, address(this), _extraData);
                 return true;
                }
        }
