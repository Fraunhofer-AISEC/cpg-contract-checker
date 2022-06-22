    function transfer(address _to, uint _value, bytes calldata _data) external override returns (bool)
    {
        require(_value > 0);

        if(isContract(_to)) 
        {
            IERC223Recipient receiver = IERC223Recipient(_to);
            receiver.tokenReceived(msg.sender, _value, _data);
        }

        balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
        balances[_to] = SafeMath.add(balances[_to], _value);
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_data);

        return true; 
    }
