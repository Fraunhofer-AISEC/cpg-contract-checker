pragma solidity 0.4.18;

contract EventTest {

   string fName;
   uint age;

   event doSetInstructor();
   event instructorSetted(string name, uint age);

   function askForSetInstructor() public {
       doSetInstructor();
   }

   function setInstructor(string _fName, uint _age) public {
       fName = _fName;
       age = _age;
       instructorSetted(fName, age);
   }

   function getInstructor() public constant returns (string, uint) {
       return (fName, age);
   }

}
