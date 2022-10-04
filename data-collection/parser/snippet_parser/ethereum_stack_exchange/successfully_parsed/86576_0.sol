contract A {
  function kill (address payable to) public {
    selfdestruct(to);
  }
}

contract B {
  function run (address target, string calldata func, address to) public {
    target.delegatecall(abi.encodeWithSignature(func, to));
  }
}
