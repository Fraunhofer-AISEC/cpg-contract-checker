function _pullFromArray(uint[] storage arr, uint index) internal returns(uint[]) {
    for(uint i = index; i < arr.length - 1; i++) {
        arr[i] = arr[i+1];
    }
    if (index < arr.length) {
        delete arr[arr.length - 1];
        arr.length--;
    }
    return arr;
}
