contract Base {
  public uint x;
  function Base(uint _x) { x = _x; }
}


contract Derived1 is Base(7) {
  function Derived1(uint _y) {
    x = _y;
  }
}

contract Derived2 is Base {
  function Derived2(uint _y) Base(_y * _y) {
    x = _y;
  }
}
