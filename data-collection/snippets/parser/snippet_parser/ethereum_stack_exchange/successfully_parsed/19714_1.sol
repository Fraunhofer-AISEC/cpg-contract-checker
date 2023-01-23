struct DocumentStruct{bytes32 string1; bytes32 string2; bytes32 string3;}
mapping(bytes32 => DocumentStruct) public documentStructs;

function StoreDocument(bytes32 key,bytes32 string1,bytes32 string2,bytes32 string3) onlyOwner returns (bool success) {
    documentStructs[key].string1 = value;
    documentStructs[key].string2 = name;
    documentStructs[key].string3 = name;
    return true;
}

function RetrieveData(bytes32 key) public constant returns(string,string,string) {
    var d = bytes32ToString(documentStructs[key].string1);
    var e = bytes32ToString(documentStructs[key].string2);
    var f = bytes32ToString(documentStructs[key].string3);
    return (d,e,f);
}
function bytes32ToString(bytes32 x) constant returns (string) {
bytes memory bytesString = new bytes(32);
uint charCount = 0;
for (uint j = 0; j < 32; j++) {
    byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
    if (char != 0) {
        bytesString[charCount] = char;
        charCount++;
    }
}
bytes memory bytesStringTrimmed = new bytes(charCount);
for (j = 0; j < charCount; j++) {
    bytesStringTrimmed[j] = bytesString[j];
}
return string(bytesStringTrimmed);
}
