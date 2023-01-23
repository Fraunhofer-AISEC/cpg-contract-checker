struct JobStruct {
  uint a;
  uint b;
  uint c;
}

function sortByEtherValues (string category) public view returns (uint, uint, uint) {
  JobStruct memory js = JobStruct(1, 2, 3);
  return (js.a, js.b, js.c);
}
