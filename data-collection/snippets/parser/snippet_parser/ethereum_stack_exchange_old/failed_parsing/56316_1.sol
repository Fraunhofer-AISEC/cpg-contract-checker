contract B {

  bool public b;

  constructor() {
    b = true;
  }
}

contract A is B {

  ...
}
