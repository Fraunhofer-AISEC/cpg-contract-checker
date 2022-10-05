pragma solidity ^0.5.2;

contract Coursetro {

   string fName="foo";
   uint age=123;

   function setInstructor(string memory _fName, uint _age) public {
       fName = _fName;
       age = _age;
   }

   function getInstructor() public view returns (string memory,uint){
       return (fName,age);
   }

}
