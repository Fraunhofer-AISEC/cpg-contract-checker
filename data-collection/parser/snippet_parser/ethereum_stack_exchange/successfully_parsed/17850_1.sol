function remove(uint[] array, uint index) returns(uint[] value) {
    if (index >= array.length) return;

    uint[] memory arrayNew = new uint[](array.length-1);

    for (uint i = 0; i < index; i++)
    {
        arrayNew[i] = array[i];    
    } 

    for (uint j = index; j<array.length-1; j++){
        uint val = array[j+1];
        arrayNew[j] = val;
    } 

    return arrayNew;
}
