function remove(uint ind) internal returns(address[]) {
    delete addressStorage[ind];
    for (uint j = ind; j<addressStorage.length;j++) {
        if (j==addressStorage.length-1) {
            break;
        }else {
            addressStorage[j] = addressStorage[j+1];
        }
    }
    addressStorage.length--;
    return addressStorage;
}
