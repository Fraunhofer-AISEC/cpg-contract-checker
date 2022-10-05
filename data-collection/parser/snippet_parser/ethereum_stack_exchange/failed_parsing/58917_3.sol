event Event(uint256 val);
function addId() public returns (uint256) {
    newId++;
    emit Event(newId);
    return newId;
}
