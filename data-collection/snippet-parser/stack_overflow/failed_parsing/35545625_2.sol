contract MyContract {
    event Deposit(address indexed _from, uint256 _value);
    
    function deposit(uint256 value) public {
        ...
        emit Deposit(msg.sender, value);
        ...
    }
}
