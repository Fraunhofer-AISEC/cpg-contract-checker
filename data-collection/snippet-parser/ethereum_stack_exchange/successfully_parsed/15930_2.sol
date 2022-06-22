pragma solidity ^0.4.6;

contract D {

  
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

}

contract E {

  
  D d;

  
  struct DocumentStruct{
    bytes32 name;
    uint value;
  }    

  
  function E(address DContractAddress) {
    d = D(DContractAddress);
  }

  function RetrieveData(bytes32 key) 
    public
    constant
    returns(bytes32, uint) 
  {
    
    DocumentStruct memory doc;
    
    (doc.name, doc.value) = d.documentStructs(key);
    
    return(doc.name, doc.value);
  }
}
