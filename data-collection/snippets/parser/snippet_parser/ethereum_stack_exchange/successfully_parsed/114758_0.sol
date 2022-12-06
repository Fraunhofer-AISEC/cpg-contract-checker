function UpdateAllowance(address _user, uint _amount) internal onlyOwner Permissions(_amount) {
         _amount = _amount*toWei; 
        emit AllowanceChange(_user, msg.sender, allowance[_user]._allowance - _amount, allowance[_user]._allowance, _x - int(_amount));
        allowance[_user]._allowance -= _amount;
    }
