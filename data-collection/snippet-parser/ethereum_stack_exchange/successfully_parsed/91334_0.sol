pragma solidity >=0.5.0;

contract A {
     uint[1] public MyArray;
     constructor() public {
         MyArray[0] = 56;
     }
  
}
contract B {
    function DoIt() public returns (uint) {
        A contr = new A();
        return contr.MyArray(0);
    }
}
