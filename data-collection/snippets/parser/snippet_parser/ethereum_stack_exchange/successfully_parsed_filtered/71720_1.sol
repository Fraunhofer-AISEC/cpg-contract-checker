contract FormSubmit{

  struct Student {
      string  email;
  }

  event SetData (
     uint studentId
  );

  mapping(address => Student[]) Students;

 function setData(address _address) public
{
  
  
  uint studentId = students.length;
  Student student = Student(_email);
  Students[_address].push(student);
  emit SetData(studentId); 
}

function getData(address _address, uint _studentId ) public view returns(string memory){
  return(Students[_address][_studentId].email);
}}
