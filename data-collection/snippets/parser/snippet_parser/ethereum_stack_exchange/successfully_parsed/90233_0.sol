function depositETHforXYZ() public payable freezeFunction returns(bool success) {
        require(msg.value > 0 ether, "Cannot be 0");
        require(msg.sender.balance > 0 ether, "Not enough funds");
 
        totalSupply = totalSupply.add((msg.value.mul(conversionRate)).div(1000000000000000000));
        balanceOf[msg.sender] = balanceOf[msg.sender].add((msg.value.mul(conversionRate)).div(1000000000000000000));

        emit Swap(msg.sender, "ETH", msg.value, "XYZ", msg.value.mul(conversionRate));
        emit TokensMinted(msg.value.mul(conversionRate));
        emit Deposit(msg.sender, msg.value);

        return true;
    }

    function withdrawXYZforETH(uint _xyzAmount) public freezeFunction returns(bool success) {
        require(balanceOf[msg.sender] != 0, "No funds to withdraw");
        require(balanceOf[msg.sender] >= _xyzAmount, "Not enough funds to withdraw");
        
        totalSupply = totalSupply.sub(_xyzAmount);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_xyzAmount);
        
        msg.sender.transfer((_xyzAmount.div(conversionRate)).mul(1000000000000000000));
        
        emit Swap(msg.sender, "XYZ", _xyzAmount, "ETH", _xyzAmount.div(conversionRate));
        emit TokensBurned(_xyzAmount);
        emit Withdrawal(msg.sender, (_xyzAmount.div(conversionRate)));
        
        return true;
    }
