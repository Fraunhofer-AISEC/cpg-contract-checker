Struct[] public objects;
mapping(address => uint256[]) private indicies;
function getIndicies() constant returns (uint256[]) {
  return indicies[msg.sender];
}
