function getPostAcceptedByByRow(address post, uint row) public returns(address acceptedBy) {
  return postStructs[post].acceptedBy[row];
}
