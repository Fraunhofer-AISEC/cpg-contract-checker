
struct State {
  uint8 myNumber;
  int24 myInteger;
}

function doSomething() {
  return myInteger + int24(uint24(myNumber));
}


struct State {
  int24 myNumber;
  int24 myInteger;
}

function doSomething() {
  return myInteger + myNumber;
}
