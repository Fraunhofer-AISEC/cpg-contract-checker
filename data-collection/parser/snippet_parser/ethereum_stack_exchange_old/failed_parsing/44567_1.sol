event Instructor(
  string name,
  uint age
);

function setInstructor(string _fname, uint _age) public {
    fName = _fname;
    age = _age;
     Instructor(_fname, _age); 
}
