function balanceOf(address _owner) public constant returns (uint balance) {
    return _sumBalances(_owner);
}
