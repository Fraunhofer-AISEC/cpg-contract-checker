    function approve(address _spender, uint _value, bytes _data) public returns (bool) {
        require(_spender != address(this));
        super.approve(_spender, _value);
        require(_spender.call(_data));
        return true;
}
