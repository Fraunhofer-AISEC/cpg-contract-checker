library TestLib {
  struct Data {
    uint n;
  }

  function Set(Data storage self, uint a) {
    self.n = a;
  }

  function Get(Data storage self) returns(uint) {
    return self.n;
  }
}
