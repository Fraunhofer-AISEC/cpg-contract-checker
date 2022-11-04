function foo(uint n) public {
    require(yourContract.winningThreshold() == yourContract.registrarCounter() + 1);
    uint CurrentStake = yourContract.stake();
    yourContract.register(n);
    uint[] memory seeds = yourContract.revealWinningSeeds();
    require(seeds[seeds.length - 1] > currentStake);
}
