mapping(uint => property) selectedProperty;
function createProperty(string memory l,uint sf,string memory on,string memory OID,string memory PID) { 
     selectedProperty[PID].location = l;
     selectedProperty[PID].sqFeet = sf;
     selectedProperty[PID].owners.push(owner(on,OID));
}
function display(uint PID) public view returns(property memory) {
     return selectedProperty[PID]
} 
