contract CheckAddress{
 mapping(string => mapping(address => bool)) public Groups;

 function CheckAddress(){
  }

 function setAddresToGroup(address addr, string group) public {
   Groups[group][addr] = true; 
 }

 function checkExistenceInGroup(address addr,string group) public returns (bool){
   return Groups[group][addr]; 
 }
}
