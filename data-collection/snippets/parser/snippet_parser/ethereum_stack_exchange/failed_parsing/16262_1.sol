function issue(string _key, 
    string _identityType, 
    string _identityHash, 
    string _dataHash) {

    require(!key_exists(sha3(_key, certificates)]

    certificates[sha3(_key)] = Certificate(
        msg.sender,
        _identityType,
        _identityHash,
        _dataHash,
        false
    );
}
