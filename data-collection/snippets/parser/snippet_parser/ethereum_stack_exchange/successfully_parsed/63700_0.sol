
function batchMint(address[] _to, uint256[] _amount) external
canMint
returns (bool) {
    require(_to.length == _amount.length);
    for (uint i = 0; i < _to.length; i++) {
        require(_to[i] != address(0));
        require(mint(_to[i], _amount[i]));
    }
    return true;
}
