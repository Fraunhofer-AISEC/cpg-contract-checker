contract myContract {
  uint a1;
  uint b1;
  function prepare(uint _a1, uint _b1...) {
    a1 = _a1;
    b1 = _b1;
    ...
  }
  function execute(uint _a2, uint _b2, ...) {
   
   deployedContract.A(a1, _a2, ...);
   deployedContract.B(b1, b2, ...);
  }
}
