function remainderBetter(uint i) public pure returns(uint){
    uint r = i % 4;
    if (r == 0) {
        return 4;
    }

    return r;
}
