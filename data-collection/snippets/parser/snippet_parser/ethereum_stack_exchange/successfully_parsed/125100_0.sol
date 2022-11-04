pragma solidity 0.8.10;

contract Example {
   address theFirst;
   
   constructor(address[] calldata _addressList) {
      theFirst = _addressList[0];
   }
}
