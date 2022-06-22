struct IdStruct{
    bytes12[] structArray; 
}

mapping(string => IdStruct) idStructs;

function appendNames(string id, bytes12 name) payable returns (bool success){ 
 idStructs[id].structArray.push(name); 
} 

function getName(string id) returns(bytes12[]){ 
  return idStructs[id].structArray; 
}
