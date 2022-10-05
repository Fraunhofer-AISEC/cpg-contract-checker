struct MyStruct {
  uint256 id;
  bytes32 name;
}

MyStruct[] _structs;

function getAllStructs() public constant returns (uint256[], bytes32[]) {
    uint256[] memory ids = new uint256[](_structs.length);
    bytes32[] memory names = new bytes32[](_structs.length);

    for (uint i = 0; i < _structs.length; i++) {
        ids[i] = _structs[i].id;
        names[i] = _structs[i].name;
    }

    return (ids, names);
}
