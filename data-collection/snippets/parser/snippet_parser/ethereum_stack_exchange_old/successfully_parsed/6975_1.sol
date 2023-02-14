contract A {
  A other;
  function Get() constant returns(bytes8[]) {
    bytes8[] stuff;
    return stuff;
  }
  function Copy() {
    bytes8[] stuff = other.Get();
  }
}
