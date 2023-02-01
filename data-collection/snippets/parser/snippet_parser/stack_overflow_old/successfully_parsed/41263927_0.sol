pragma solidity ^0.4.6;
contract Add{
  function sum(uint x, uint y) returns(uint){
    return x+y;
  }
}
contract Sum{
  function func(uint x, uint y) returns(uint){
    Add add = new Add();
    uint re = add.sum(x,y);
    return re;
  }
}
