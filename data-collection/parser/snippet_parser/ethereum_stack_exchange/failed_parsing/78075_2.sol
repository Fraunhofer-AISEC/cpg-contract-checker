modifier isValidDuration() {
    uint256 calculatedDuration = end.sub(start);
    require(calculatedDuration >= 15 minutes, "The minimum duration is 15 minutes");
    require(calculatedDuration <= 1 weeks, "The maximum duration is 1 week");
    _;
}
