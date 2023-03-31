function getVotesWithParams(
    address account,
    uint256 blockNumber,
    bytes memory params
) public view virtual override returns (uint256) {
    return _getVotes(account, blockNumber, params);
}
