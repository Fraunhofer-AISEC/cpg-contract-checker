function addInfo(student memory _student, address _address) public {
    require(owner == msg.sender, "Only admin can add Info!!!");
    Info[_address] = _student;
    student_Info.push(_student);
} 
