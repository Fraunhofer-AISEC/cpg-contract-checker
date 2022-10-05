function delegateTokens(uint256 _value) returns (bool result) {
    tokens[msg.sender] = _value;
    return token.delegatecall(bytes4(sha3("transfer(address,uint256)")), address(this), _value);
}
