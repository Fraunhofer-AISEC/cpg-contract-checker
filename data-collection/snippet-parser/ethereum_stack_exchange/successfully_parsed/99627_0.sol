pragma solidity >=0.7.0 <0.8.0;   
contract con1{
uint public x;
event e1 (uint);
function f()public{
    x=5;
    emit e1(x);
  }
}
