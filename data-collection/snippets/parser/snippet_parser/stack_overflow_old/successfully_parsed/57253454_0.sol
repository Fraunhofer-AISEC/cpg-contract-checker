struct mystruct {
    bytes32 id; 
    string str;
}

mapping (bytes32 => mystruct) structs;

function creatMyStruct(bytes32 id, string memory str) public {
    mystruct memory newStruct = mystruct(id, str);
    structs[id] = newStruct;
}
