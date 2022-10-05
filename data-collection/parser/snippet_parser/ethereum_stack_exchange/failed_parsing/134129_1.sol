 function withdrawl(address _from, uint256 _amount) public onlyAdmin {
        require(balances[_from] >= _amount);
        balances[_from] = balances[_from].sub(_amount);
        circulationsupply = circulationsupply.sub(_amount);
        emit withdraw(_from, _amount);
    }

   modifier onlyAdmin() {
        require(admins[msg.sender]);
        _;
    }
