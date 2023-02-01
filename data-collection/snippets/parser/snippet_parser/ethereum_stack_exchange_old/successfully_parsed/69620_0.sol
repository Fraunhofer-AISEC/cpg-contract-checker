contract A {

   function sendValue(B _externalContract, uint _value) {
     _externalContract.acceptValue(_value);
   }
}

contract B {
   function acceptValue(unit value);
}
