function setData(uint256 uuid, string someData) public {
    var struct_ = myMapping[uuid];
    struct_.someData= someData;
}
