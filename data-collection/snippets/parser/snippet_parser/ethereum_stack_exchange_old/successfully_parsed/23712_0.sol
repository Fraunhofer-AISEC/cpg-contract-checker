function SetMessage (bytes32 key, bytes32 message) returns (bool success) {
    publicStruct[key].message = message;
    return true;
    }

    function GetMessage (bytes32 key) public constant returns (bytes32) {
    var message = publicStruct[key].message;
    return message;
    }
