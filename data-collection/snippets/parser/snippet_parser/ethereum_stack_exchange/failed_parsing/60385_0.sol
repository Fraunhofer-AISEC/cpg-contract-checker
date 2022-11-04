struct Sample {
    bytes32 key;
    string str1;
    .
    .
    .
    .
    .
    string str8;
    byts32[] someArray; 
}

mapping(bytes32 => Sample) sampleMap;

function set(bytes32 key,string str1,string str2,......,string str8,bytes32[] array) public returns(bool) {
    
    return true;
}

function get(bytes32 key) returns(bytes32 key,string str1,string str2,......,string str8,bytes32[] array) {
    
}
