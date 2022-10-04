uint256 private _start_timestamp = block.timestamp;

function _getMultiplier() private view returns (uint256) {
    uint256 time_since_start = block.timestamp - _start_timestamp;
    uint256 hour = 60 * 60;
    if (time_since_start < 1 * hour) {
        return (3);
    } else if (time_since_start < 2 * hour) {
        return (2);
    } else {
        return (1);
    }
}
