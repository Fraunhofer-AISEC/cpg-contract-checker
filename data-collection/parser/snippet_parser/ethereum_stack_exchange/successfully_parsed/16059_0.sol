  struct DocumentStruct{
bytes32 name;
uint value;
}

 mapping(bytes32 => DocumentStruct) public documentStructs;

 function StoreDocument(bytes32 key, bytes32 name, uint value) returns (bool success) {
  documentStructs[key].name  = name;
 documentStructs[key].value = value;
 return true;
}
