function getAllowance(address _owner, address _spender) public view returns (uint256) {
    Storage s = Storage(storageAddress);
    return s.allowance(_owner, _sender);
}
