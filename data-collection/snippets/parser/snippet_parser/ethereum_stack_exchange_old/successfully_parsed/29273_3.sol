function getRightCoordinate(byte input) returns(uint) {
    byte val = input & byte(15);
    return uint(val);
}

function getLeftCoordinate(byte input) returns(uint) {
    byte val = input >> 4;
    return uint(val);
}
