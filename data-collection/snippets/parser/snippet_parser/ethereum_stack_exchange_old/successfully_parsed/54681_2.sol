function get(uint256 y, address _owner) public{
   arraymapping[_owner].arrayvalue.push(y);
   emit logg(y,_owner);
}
