function transferToAddress(address _to, uint _value, bytes memory _data) internal returns (bool success) {
        require (_to != msg.sender && _to != address(0));
        uint fee = calculateFee(_value);
        require (_value > 0);
        require (balances[msg.sender] >= _value);
        require (balances[_to].add(_value) >= balances[_to]);
        uint sendAmount = _value.sub(fee);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].add(fee);
            emit Transfer(msg.sender, owner, fee,_data);
        }
        holderIsExist(_to);
        emit Transfer(msg.sender, _to, _value, _data);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }


function calculateFee(uint _amount)public view returns(uint){
            uint fee = (_amount.mul(basisPointsRate)).div(1000);
            if (fee > maximumFee) {
                    fee = maximumFee;
            }
            if (fee < minimumFee) {
                fee = minimumFee;
            }
            return fee;
        }
