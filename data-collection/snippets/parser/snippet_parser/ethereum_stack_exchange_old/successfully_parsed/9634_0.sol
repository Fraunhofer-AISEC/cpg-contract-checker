contract SimpleStorage {
    mapping(bytes32 => string) storedData;

    function set(bytes32 key, string value) {
        storedData[key] = value;
    }

    function get(bytes32 key) constant returns (string retVal) {
        return storedData[key];
    } 
}
