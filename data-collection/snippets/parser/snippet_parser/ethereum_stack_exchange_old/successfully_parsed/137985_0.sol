function investInMPay(uint256 _amount) public validateInvestor(_amount) {
        Investors[msg.sender] = investor(block.timestamp, _amount);
        transferTokenToInvestor(msg.sender, _amount);
    }

function transferTokenToInvestor(address _to, uint256 _value) public returns (bool success) {
       require(balanceOf[owner] >= _value);
        _transfer(owner, _to, _value);
        return true; 
    }

function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0));
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value, balanceOf[_to]);
    }
