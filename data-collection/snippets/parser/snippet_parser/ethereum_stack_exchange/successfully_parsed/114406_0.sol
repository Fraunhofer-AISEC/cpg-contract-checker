function updateStruct(
    uint256 dummyParam
) public onlyOwner {
    DummyStruct memory dummy = dummyStructArray[dummyParam];
    dummy.something = 1;
}
