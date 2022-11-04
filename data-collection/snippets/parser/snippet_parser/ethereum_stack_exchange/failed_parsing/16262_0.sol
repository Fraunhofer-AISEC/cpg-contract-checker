contract Truerec {
    struct Certificate {
        address issuerAddress;
        string  identityType;
        string  identityHash;
        string  dataHash;
        bool   revoked;
    }

    mapping(bytes32 => Certificate) certificates;

    function issue(string _key, 
        string _identityType, 
        string _identityHash, 
        string _dataHash) {
        certificates[sha3(_key)] = Certificate(
            msg.sender,
            _identityType,
            _identityHash,
            _dataHash,
            false
        );
    }
    ...
}
