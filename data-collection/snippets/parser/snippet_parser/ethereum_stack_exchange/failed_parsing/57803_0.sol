function getStudent(string _searchHash) payable public {
      var searchHash = _searchHash;
      university.transfer(msg.value);
      for(uint i=0; i<students.length; i++)
      {
          if (keccak256(students[i].hash) == keccak256(searchHash))
          {
              emit foundStudentInfo(students[i].fname, students[i].year, 
                   university.balance);
          }
      }
      emit foundStudentInfo("Failed","Failed",university.balance);
  }
}
