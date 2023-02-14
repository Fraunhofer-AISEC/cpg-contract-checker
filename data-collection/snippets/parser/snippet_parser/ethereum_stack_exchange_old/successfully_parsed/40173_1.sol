function deleteElement(string id, bytes12 name){
    for(uint index=0;index<idStructs[id].structArray.length;index++){
        if(idStructs[id].structArray[index]==name){
            delete idStructs[id].structArray[index];
            break;
        }
    }
}
