pragma solidity ^0.4.0;
contract Ballot {
  struct EntityStruct {
    uint[] entityData;
    bool isEntity;
    bool iscontent;
    uint vote;
    uint predata;
    string isrep;
  }

    mapping(address => EntityStruct) public entityStructs;
    mapping(uint => entityData) public enitiyinfo;
    uint[] public datalist;
    address[] public entityList;

function newEntity(address entityAddress, uint entityDataa) public returns(uint rowNumber) {
   bytes32 datahash;
   uint counter = 0;
   datahash = keccak256(abi.encodePacked(entityDataa));
   for (uint i=0; i<entityList.length; i++)
   {
       for (uint y=0; y<datalist.length; y++)
       {
           
       if (datahash == keccak256(abi.encodePacked(entityStructs[entityList[i]].entityData[datalist[y]])))
       {
       counter = counter+1;
       }
   }
   }
 
  
   require(counter == 0,"not aloowed!!");
   entityStructs[entityAddress].entityData.push(entityDataa);
  
   entityStructs[entityAddress].isEntity = true;
   return entityList.push(entityAddress)-1;
   
   

}

function SearchForContent( uint data) public{
    uint rr = 0;
           for (uint i=0; i<entityList.length; i++) {
               for (uint y=0; y<5; y++)
               {
                   
               
               if ( data == entityStructs[entityList[i]].entityData[y])
               rr = rr+1;
           }
           require(rr >0,"not available data");
              
               
            
                          
}
}
}
