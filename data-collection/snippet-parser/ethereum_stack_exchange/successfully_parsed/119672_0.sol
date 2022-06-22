struct LockRoundData {
        uint256[] dates;
}
mapping(uint256 => LockRoundData) public lockRoundMapping;

function setLockRound(
        uint256[] _dates
) public {
        lockRoundMapping[0].dates = _dates;
}
