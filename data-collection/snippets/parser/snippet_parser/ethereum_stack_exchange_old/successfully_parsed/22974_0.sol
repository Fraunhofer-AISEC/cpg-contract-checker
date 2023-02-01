mapping (uint => address) public owner;
mapping (address=> uint[]) public ids;

function getLength(address idOwner) constant returns (uint len) {
  len = ids[idOwner].length;
}
