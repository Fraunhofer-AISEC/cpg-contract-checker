contract B {

  constructor(address user) {
  ...
}


contract C {

  constructor(bytes32 property, bool residential) {
  ...
}

contract A is B, C {

  constructor(address user, bytes32 property, bool residential) 
    B(user)
    C(property, residential)
  {
    
  }
}
