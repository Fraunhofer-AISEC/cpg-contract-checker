contract Test {

    event Event(string _msg, address _address, uint _amount);

    function() public payable {
    }

    function pay(uint _amount) public returns (uint256) {
        require(this.balance >= _amount);

        _pay(msg.sender, _amount);
    }

    function _pay(address _to, uint _amount) private {
        _to.transfer(_amount);
        Event("Outcome", _to, _amount);
    }
}
