function getPostAddressCount(address post, uint row) public returns(uint count) {
  return postStructs[post].address.length;
}

function getPostAcceptedBy(address post) public returns(address[] acceptedBy) {
  return postStructs[post].acceptedBy;
}
