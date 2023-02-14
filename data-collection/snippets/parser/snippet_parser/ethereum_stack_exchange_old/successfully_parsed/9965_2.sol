contract Student {
  uint public studentId;

  function getStudentId() public returns (uint) {
    return studentId++;
  }
}
