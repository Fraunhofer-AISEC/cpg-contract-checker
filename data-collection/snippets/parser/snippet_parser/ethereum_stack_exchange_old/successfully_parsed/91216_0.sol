struct EntityStruct {
   uint entityData; 
   bool isEntity; 
   bool iscontent; 
   uint vote; 
   uint predata; 
}

mapping(address => EntityStruct) public entityStructs; address[] public entityList;

function newEntity(address entityAddress, uint entityDataa) public payable returns() {

entityStructs[entityAddress].entityData = entityDataa; 
entityStructs[entityAddress].isEntity = true; 
entityList.push(entityAddress) - 1;

}
