pragma solidity >=0.4.22 <0.6.0;

contract ContractA {

      int a;

      function setA(int _a)  public {
           a = _a;
      }
      function getA() view public returns(int){
           return a;
      }
}
