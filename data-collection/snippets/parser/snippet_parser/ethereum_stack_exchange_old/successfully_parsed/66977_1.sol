function remove(uint _valueToFindAndRemove, uint[] _array)  returns(uint[]) {

    uint[] storage auxArray;

    for (uint i = 0; i < _array.length; i++){
        if(_array[i] != _valueToFindAndRemove)
            auxArray.push(_array[i]);
    }

    return auxArray;
}
