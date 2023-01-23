function transfer(address _to, uint256 _value)
        external
        payable
        returns (bool success)
    {function transfer(address _to, uint256 _value)
        external
        payable
        returns (bool success)
    {
        require(balancesOf[msg.sender] >= _value);
        require(_to != address(0));
        require(balancesOf[_to] + _value > balancesOf[_to]);
        balancesOf[msg.sender] -= _value;
        balancesOf[_to] += _value;
        return true;
    }
