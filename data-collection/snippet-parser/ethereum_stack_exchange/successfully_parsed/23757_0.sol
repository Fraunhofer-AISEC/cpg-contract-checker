    contract Oracle {
        struct DocumentStruct{bytes32 name; uint value;}
        mapping(bytes32 => DocumentStruct) public documentStructs;

        function StoreDocument(bytes32 key,bytes32 name, uint value) returns (bool success) {
            documentStructs[key].value = value;
            documentStructs[key].name = name;
            return true;
        }
    }

contract Reader {
      address public oracleID;
      Oracle d;
  function Reader(address OAddress){
      d = Oracle(OAddress);
      oracleID = OAddress;
          }
 struct DocumentStruct{bytes32 name; uint value;}
  function RetrieveData(bytes32 key) public constant returns(uint) {
    DocumentStruct memory doc;
    (doc.name,doc.value) = d.documentStructs(key);
    return doc.value;
  }
    }
