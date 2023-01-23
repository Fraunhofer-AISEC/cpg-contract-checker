 pragma solidity ^0.4.11;

  contract test{
    event Print(string _name, uint _value);
    function test() payable{
        uint testval = 5;
        Print('val',(testval * 1000000000000000000));
        Print('val2',(5 ether));
    }
  }
