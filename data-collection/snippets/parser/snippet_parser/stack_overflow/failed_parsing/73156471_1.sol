...

function totalSupply() public constant returns (uint) {
    if (deprecated) {
        return StandardToken(upgradedAddress).totalSupply();
    } else {
        return _totalSupply;
    }
}
...
