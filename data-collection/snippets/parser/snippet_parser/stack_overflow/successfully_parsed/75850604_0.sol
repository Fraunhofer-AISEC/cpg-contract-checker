struct student{
    string firstName;
    string lastName;
    uint age;
    string universityName;
    string department;
    uint semester;
    uint rollNo;
    string isUniversityCardAvailable;
}

  student[] studentRecord;

function addStudent(string memory firstName, string memory lastName, uint age, string memory universityName, string memory department,
 uint semester, uint rollNo, string memory isUniversityCardAvailable) public {
    studentRecord.push(student(firstName,lastName,age,universityName,department,semester,rollNo, isUniversityCardAvailable));
}

function getStudent(uint index) public view returns(string memory, string memory, uint, string memory, string memory, uint, uint, string memory) {
    return (studentRecord.length[index].firstName, studentRecord.length[index].lastName,studentRecord.length[index].age, studentRecord.length[index].universityName, studentRecord.length[index].department, studentRecord.length[index].semester, studentRecord.length[index].semester, studentRecord.length[index].semester, studentRecord.length[index].semester, studentRecord.length[index].rollNo, studentRecord.length[index].isUniversityCardAvailable);
}
