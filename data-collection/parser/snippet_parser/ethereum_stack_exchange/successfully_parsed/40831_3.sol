    function increaseApproval(address _spender, uint _addedValue, bytes _data) public returns (bool) {
        require(_spender != address(this));
        super.increaseApproval(_spender, _addedValue);
        require(_spender.call(_data));
        return true;
    }
