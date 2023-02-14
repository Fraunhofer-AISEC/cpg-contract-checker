
function snapshotDividendDumb(address[] memory _addrs, uint256[] memory _rewards) public {
    require(_addrs.length == _rewards.length, "New rewards and address arrays must be of equal length.");
    for (uint i = 0; i < _addrs.length; i++ ) {
        pendingRewards[_addrs[i]] += _rewards[i];
    }
}
