function returnNumberTest1() public returns(uint) {
    uint256 n = 85055054;

    return n & 0xff;
}

function returnNumberTest2() public returns(uint) {
    uint256 n = 55058618935774054120265983768542913389624544203505105799354858217531716133001;

    return n & 0xff;
}
