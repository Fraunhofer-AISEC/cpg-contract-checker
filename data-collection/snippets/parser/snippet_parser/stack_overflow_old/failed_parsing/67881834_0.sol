contract A {
 uint256 a_;
 string b_;

 function foo(uint256 a, string b, address c) extenal {
  tvm.accept();
  B(c).bar{value: 1 ton, callback: A.callback}(a, b);
 }

 function callback(uint256 a, string b) external {
  tvm.accept();
  a_ = a;
  b_ = b;
 }
}

contract B {
 function bar(uint256 a, string b) exrnal responsible returns (uint256, string) {
  return { value: 0, bounce: false, flag: 64 } (a, b);
 }
}
