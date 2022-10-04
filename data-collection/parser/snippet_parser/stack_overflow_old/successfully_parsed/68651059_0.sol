function _finalization() internal {
    if (goalReached()) {
        ERC20Mintable erc20Mintable = ERC20Mintable(token);
        
        uint256 alreadyMintedToken = erc20Mintable.totalSupply();

        
        uint256 finalTotalTokenSupply = alreadyMintedToken
            .div(tokenSalePercentage)
            .mul(100);

        foundersTimelock = new TokenTimelock(
            token,
            foundersFund,
            releaseTime
        );
        partnersTimelock = new TokenTimelock(
            token,
            foundersFund,
            releaseTime
        );
        foundationTimelock = new TokenTimelock(
            token,
            foundersFund,
            releaseTime
        );

        
        erc20Mintable.mint(
            address(foundersTimelock),
            finalTotalTokenSupply.mul(foundersPercentage).div(100)
        );
        erc20Mintable.mint(
            address(partnersTimelock),
            finalTotalTokenSupply.mul(partnersPercentage).div(100)
        );
        erc20Mintable.mint(
            address(foundationTimelock),
            finalTotalTokenSupply.mul(foundationPercentage).div(100)
        );

        erc20Mintable.renounceMinter();
        

        ERC20Pausable erc20Pausable = new ERC20Pausable(token);
        erc20Pausable.unpause();

        erc20Pausable.renounceOwnership(wallet);
    }
    super._finalization();
}
