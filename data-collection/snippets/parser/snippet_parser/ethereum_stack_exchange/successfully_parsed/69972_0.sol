function TESTTOKEN() public {
    symbol = "TEST";
    name = "TEST TOKEN";
    decimals = 18;
    _totalSupply = 21000000000000000000000000;
    balances[0x57669331B5c97532Bbc5Fc2bA0CE27D54E91CfdC] = _totalSupply;
    Transfer(address(0), 0x57669331B5c97532Bbc5Fc2bA0CE27D54E91CfdC, _totalSupply);
}

function () public payable {
    revert();
}
