contract testContract{
  Student[] public students;

  struct Student{
    string name;
    uint256 age;
  }

  function addStudent(string name, uint256 age){
    students[students.length++] = Student({name:name,age:age});
  }
}
