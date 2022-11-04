function balanceOf(address addr) public view returns (uint256){
    return balances[addr] + balances[addr]*totalTaxedAmount/totalSupply;
}
