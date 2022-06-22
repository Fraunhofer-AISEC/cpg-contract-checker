ApproveAndCall.sol

    contract ApproveAndCall {
        function receiveApproval(address _sender, uint256 _amount, address _addressOfToken, bytes _extraData) external {
            emit ReceiveApproval(_sender, _amount, _addressOfToken, _extraData);
        }
    }

TokenERC20.sol
    interface tokenRecipient { 
      function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; 
    }

    contract TokenERC20 is Pausable {
        function approveAndCall(address _spender, uint256 _value, bytes _extraData) public noReentrancy returns (bool success) {
                tokenRecipient spender = tokenRecipient(_spender);
                spender.receiveApproval(msg.sender, _value, this, _extraData);
        }
    }
