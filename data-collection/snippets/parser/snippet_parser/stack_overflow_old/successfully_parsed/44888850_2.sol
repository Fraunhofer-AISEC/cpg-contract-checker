contract token {    
    event Transfer(address indexed from, address indexed to, uint256 value);
    function transfer(address _to, uint256 _value) {
        if (_to == 0x0) throw;
        Transfer(msg.sender, _to, _value);
    }

}
