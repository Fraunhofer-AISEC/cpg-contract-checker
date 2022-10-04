interface Token {
    function transfer(address _to, uint256 _value) returns (bool);
    function balanceOf(address _owner) constant returns (uint256 balance);
}
