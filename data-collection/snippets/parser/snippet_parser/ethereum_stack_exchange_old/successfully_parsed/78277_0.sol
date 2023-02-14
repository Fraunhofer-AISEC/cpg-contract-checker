pragma solidity >=0.4.21 <0.6.0;
contract Simple {
   uint256 storedNumber;

   function setNumber(uint256 x) public {
        storedNumber = x;
   }
   function getNumber() public view returns (uint256) {
        return storedNumber;
   }
}
