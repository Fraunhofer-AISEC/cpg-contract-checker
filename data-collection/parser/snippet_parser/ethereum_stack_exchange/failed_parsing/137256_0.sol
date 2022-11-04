contract storage {
   bytes32 data;

   function f(uint256 _a, uint256 _b) public {
      bytes32 hash = keccak256(abi.encode(_a, _b));
      data = hash;
   }
}
