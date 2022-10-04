uint[] public results;

function listHomesByAddress(string _physicalAddress) public returns(uint) {
    uint counter = 0;
    for(uint i = 0; i < homes.length; i++) {
        string location = homes[i].physicalAddress;
        if(StringUtils.equal(location, _physicalAddress)) {
            counter++;
            results[i] = homes[i].id;
        }
    }
    return getArray(counter);
}

function getArray(uint _length) public returns (uint[]) {
    uint[] memory arr = new uint[](_length);
    for (uint i = 0; i < _length; i++) {
        arr[i] = results[i];
    }
    return arr;
}
