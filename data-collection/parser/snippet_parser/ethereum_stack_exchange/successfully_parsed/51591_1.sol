mapping (address => bytes32[10]) myMap;
function get(address _addr) public returns (bytes32[10]){
   return myMap[_addr];
}
