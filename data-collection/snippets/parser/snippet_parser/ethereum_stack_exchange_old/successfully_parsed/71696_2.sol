function sweeperOf(address _token) returns (address) {
    address sweeper = sweepers[_token];
    if (sweeper == 0) sweeper = defaultSweeper;
    return sweeper;
}
