function exists(bytes32 key) public view returns(bool doesIndeed) {
  return <expression>;
}

function get(bytes32 key) public {
  require(exists(key),"Can't do that. It doesn't exist");
  return ...
}
