uint256 startTime = now;

function howManyMonths() public view returns (uint256) {
    return (now - startTime) / 30 days;
}
