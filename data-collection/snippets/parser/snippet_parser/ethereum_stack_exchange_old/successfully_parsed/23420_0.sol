pragma solidity ^0.4.13;


contract Test{
  address public party1;
  address public party2;
  enum SState {zero,one,two,three}
  SState public currentState;

  modifier onlyState(SState expectedState) {require(expectedState == currentState);_;}
  function Test() {
      currentState = SState.zero;
  }
  function pay1() payable onlyState(SState.zero) {
    require(msg.value == 1000000000000000000);
    party1 = msg.sender;
    currentState = SState.one;
  }
   function pay2() payable onlyState(SState.one){
    require(msg.value == 1000000000000000000);
    party2 = msg.sender;
    currentState = SState.two;
  }

  function finish(bool _winner) onlyState(SState.two){
    currentState = SState.three;
    if (_winner){
      party1.send(this.balance);
    }
    else {
      party2.send(this.balance);
    }
  }

}
