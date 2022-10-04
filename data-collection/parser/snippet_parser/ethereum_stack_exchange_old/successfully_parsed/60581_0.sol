function indexOfUint(uint256[] _array, uint _value) public pure returns (uint256) {
    bool exist;
    for (uint i=0; i<_array.length;i++){
        if(_array[i] == _value){
            exist = true;
            return i;
        }
    }
    assert(exist == true);
}
