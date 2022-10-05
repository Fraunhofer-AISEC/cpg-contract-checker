uint256 age;
function setInstructor(string memory _fName, uint256 _age) onlyOwner public  {
   fName = _fName;
   age = _age;
   emit Instructor (_fName, _age);
}
