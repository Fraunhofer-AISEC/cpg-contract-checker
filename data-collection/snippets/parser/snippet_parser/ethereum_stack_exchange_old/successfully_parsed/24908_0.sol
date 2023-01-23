contract A {
    mapping (address => uint256) balances;
    function testFunc1(address _to, uint256 _value) {
        balances[_to] += _value;
    }
    function testFunc2(address _to, uint256 _value) {
        balances[_to] += 1;
        balances[_to] += 1;
    }
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
}
