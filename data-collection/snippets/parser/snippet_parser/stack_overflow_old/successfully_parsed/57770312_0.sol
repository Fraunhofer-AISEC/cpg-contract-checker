pragma solidity >=0.4.22 <0.7.0;
contract RegisterLand{

struct land{
     uint area;
     string location;
     uint floorsAllowed;
     mapping(uint => address) owner;
     uint count;
     bool idExists;
}
 mapping(uint => land) lands;
 function Register(uint id,uint area, string memory location, uint 
 floorsAllowed) public
 {
    require(
            !lands[id].idExists,
            "ID already exists"
             );
  lands[id] = land(area, location, floorsAllowed,0,true);
  lands[id].owner[lands[id].count] = msg.sender;
 }
 function ViewLand(uint id) public view returns(address currentOwner, 
 uint 
 landArea, string memory landLocation, uint landFloors )
 {
  require(lands[id].idExists,
         "Id doesn't exist.");
  currentOwner = lands[id].owner[lands[id].count];
  landArea = lands[id].area;
  landLocation = lands[id].location;
  landFloors = lands[id].floorsAllowed;
 } 
}
