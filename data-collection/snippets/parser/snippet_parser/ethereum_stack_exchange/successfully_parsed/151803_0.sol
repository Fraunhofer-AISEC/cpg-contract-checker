function getBalances(address wallet, IERC20[] tokens) external view returns (uint256[] memory balances) {

    uint size = tokens.length;

    uint256[] memory balances = new uint256[](size) 
    for (uint i=0; i < size; i++) {
            
        TokenContract tokenContract = TokenContract(tokens[i]);

        balances[i] = tokenContract.balanceOf(wallet);

    }
        
    return balances;

}
