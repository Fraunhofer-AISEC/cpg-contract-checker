pragma solidity ^0.4.21;

contract A {
   uint public value;
   constructor(uint newValue) public {
        value = newValue;
   }
}

contract B {
   A aObj;

   function setAddress(address _a) public {
       aObj = A(_a);
   }

   
   function getValue() public view returns(uint) {
       return aObj.value();
   }
}
