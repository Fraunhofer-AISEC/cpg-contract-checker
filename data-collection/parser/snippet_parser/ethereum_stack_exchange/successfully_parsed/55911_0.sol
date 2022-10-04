function distribute() external onlyOwner {

    for (uint256 i = 0; i < contributors.length; i++) {
        if (contributed[contributors[i]]) {

            uint256 tokensToDistribute = ((token.balanceOf(environment)).mul(((contributions[contributors[i]].mul(100)).div(funds))).div(100));
            token.transfer(contributors[i], tokensToDistribute);

            tokensDistributed = tokensDistributed.add(tokensToDistribute);

            emit TokensDistributed(contributors[i], environment, token.balanceOf(environment), tokensToDistribute, true);
        }
    }
}
