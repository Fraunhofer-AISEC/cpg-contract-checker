function registerStudent(
    uint  _id,
    string memory _firstName,
    string memory _lastName,
    string memory _fatherName,
    string memory _motherName,
    string memory _gender,
    string memory _email,
    string memory _collegeName,
    string memory _dateOfBirth,
    string memory _mobileNumber

    ) onlyAdmin(msg.sender) public {

    
          student memory x= student(_id,_firstName,
          _lastName,_fatherName,_motherName,_gender,
          _email,_collegeName,_dateOfBirth,
          _mobileNumber,
          new all_courses[] (0),
          new warning[] (0) );
          
          studentList.push(x);

    getstudent[_id]=studentList[s_counter];
    s_counter ++;
    
}
