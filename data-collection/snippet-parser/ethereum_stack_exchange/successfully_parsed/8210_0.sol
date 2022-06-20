contract myContract {
    struct dataObject {
        uint a;
        address b;
    }
    mapping (uint => dataObject) public myMap;
    function setObject(uint key, uint _a, address _b) {
        myMap[key] = dataObject(_a,_b);
    }
}
