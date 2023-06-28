function part_store(uint index) public view returns(uint, string, string, string) {
  Part storage p = part_store[index];
  return (p.pNumber, p.pName, p.pDesc, p.pManu);
}
