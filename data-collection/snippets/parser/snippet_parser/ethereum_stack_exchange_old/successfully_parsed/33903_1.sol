function remove(uint ind, address[] array) internal returns(address[]) {
    delete array[ind];
    for (uint j = ind; j<array.length;j++) {
        if (j==array.length-1) {
            break;
        }else {
            array[j] = array[j+1];
        }
    }
    array.length--;
    return array;
}
