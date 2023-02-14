struct StringStorage {
    bytes32 key; 
    mapping(uint => string) strings; 
}

mapping(bytes32 => StringStorage) db; 


function createStringStorage(bytes32 _key) public returns(bool) {
    require(db[_key].key[0] == 0, "StringStorage already exists");

    db[key].key = _key;

    return true;
}


function set(bytes32 _key, uint _index, string _str) public returns(bool) {
    require(db[_key].key[0] != 0, "StringStorage doesn't exist");

    db[key].strings[_index] = _str;

    return true;
}


function get(bytes32 _key, uint _index) returns(string) {
    return db[_key].strings[_index];
}
