contract Callee {

  function doSomething() public returns(uint responseCode) {
    if(something()) return 1;
    if(somethingElse()) return 2;
    if(theOtherThing()) return 3;
    return 4;
  }
}

contract Caller {
  function callCallee() public returns(uint responseCode) {
    uint response = callee.doSomething();
    if(response == 1) { ...
    if(response == 2) { ...
...
