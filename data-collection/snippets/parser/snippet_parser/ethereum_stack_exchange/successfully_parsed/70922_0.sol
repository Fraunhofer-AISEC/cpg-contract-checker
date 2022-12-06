pragma solidity >=0.5.0 <0.7.0;

contract Foo {

  enum State {
    StateA,
    StateB
  }

  State internal state;

  function getState()
    public view
    returns (State)
  {
    return state;
  }
}
