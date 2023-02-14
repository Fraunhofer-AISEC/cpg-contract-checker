contract A {
  mapping (bytes32 => uint) public someMapping;
}

contract B {
  A a; 

  function B(address addressA) public { 
    a = A(addressA);
  }

  function getAUint(bytes32 key) public view returns(uint) {
    return a.someMapping(key);
  }
}
