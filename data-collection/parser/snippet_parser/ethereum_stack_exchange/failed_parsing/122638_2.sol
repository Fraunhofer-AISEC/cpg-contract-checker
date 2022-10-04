struct S {
      uint256 a;
      uint256 b;
}
...
function checkMax(S calldata _test) public pure returns (S memory) {
        S memory testing = _test; 
        S memory newTesting = testing;
        newTesting.a = 50;
        newTesting.b = 50;
        return testing; 
}
