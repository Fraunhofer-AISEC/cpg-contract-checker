function SetStruct (int _x, int _y) public returns (int) {
  data = 10;
  Test.TStruct memory s;
  s.x = _x;
  s.y = _y;
  return s.x;
}
