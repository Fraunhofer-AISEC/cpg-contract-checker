function stringCmp(string a, string b) public returns (bool){ 
  bytes memory aa=bytes(a);
  bytes memory bb=bytes(b);
  if(aa.length!=bb.length)
    return false;
  for(uint i=0; i< aa.length; i++)
    if(aa[i]!=bb[i])
      return false;
  return true;
}
