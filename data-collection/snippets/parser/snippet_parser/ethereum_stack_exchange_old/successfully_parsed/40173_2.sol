struct IdStruct {
    bytes12[] structArray; 
}

mapping(string => IdStruct) idStructs;

function appendNames(string id, bytes12 name) payable returns (bool success, uint index){ 
    idStructs[id].structArray.push(name); 
    return (true, idStructs[id].structArray.length-1);
} 

function getName(string id) returns(bytes12[]){ 
    return idStructs[id].structArray; 
}

function deleteName(string id, bytes12 name){
    for(uint index = 0;index<idStructs[id].structArray.length;index++){
        if(idStructs[id].structArray[index]==name){
            delete idStructs[id].structArray[index];
            break;
        }
    }
}
