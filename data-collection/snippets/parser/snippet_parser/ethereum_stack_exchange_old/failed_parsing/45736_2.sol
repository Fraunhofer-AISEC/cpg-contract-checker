
function storeTeacherDetails(
    uint256 tsc,
    bytes32 surname,
    bytes32 firstName,
...
    bytes32 subject1,
    bytes32 subject2,
    bytes32 email
) public {
      
      PersonalInfo storage teacher = teachers[teacherRecords.length]; 
      teacher.tsc = tsc;
      teacher.surname = surname;
      teacher.firstName = firstName;
...
      teacher.subject1 = subject1;
      teacher.subject2 = subject2;
      teacher.email = email;
}
