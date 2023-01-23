  function getAllBalances() public view returns (uint[] memory){
    uint[] memory result = new uint[](keys.length);
    for (uint i = 0; i < keys.length; i++) {
        result[i] = balances[keys[i]];
    }
    return result;
}
