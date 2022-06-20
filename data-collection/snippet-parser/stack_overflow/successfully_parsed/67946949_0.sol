function mint(uint256 _amount, address[10] memory _receivers) external {
        
        balances[msg.sender] += _amount / 2;
        emit Transfer(address(0x0), msg.sender, _amount / 2);
        
        
        
        for (uint i = 0; i < 10; i++) {
            balances[_receivers[i]] += _amount / 20;
            emit Transfer(address(0x0), _receivers[i], _amount / 20);
        }
    }
