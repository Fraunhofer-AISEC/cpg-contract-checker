contract Storage {
    function getWeight() public view returns(uint8);
    function setWeight(uint8 weight) public view returns(bool); 
}

contract Reader {
    Storage private storage;
    constructor(address storageAddress) {
        storage = Storage(storageAddress);
    }
}
