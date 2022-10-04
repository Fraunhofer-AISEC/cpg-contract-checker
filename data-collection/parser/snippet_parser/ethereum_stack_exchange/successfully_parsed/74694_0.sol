function updateValue(int _newInt) external validateUintFromInt(_newInt) {
    uint _newUint = uint(_newInt);
    globalUint = _newUint;
}
