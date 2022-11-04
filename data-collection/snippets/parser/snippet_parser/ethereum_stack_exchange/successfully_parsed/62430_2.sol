function getProblemMeta(bytes32 problemId) public view returns(bytes32, bytes32, uint) {
  p = problems[problemId];
  return (p.a, p.b, p.d);
}

function getProblemCAtIndex(bytes32 problemId, uint index) public view returns(bytes32) {
  return problems[problemId].c[index];
}
