contract MyToken
    mapping (address => uint256) public balances;

    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    ...
}
