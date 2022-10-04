  uint public SubCount = 0; 
struct Submission {
    uint id;
    address studentsaddress;
    Student student;
    Examiner examiner;
    Thesis thesis;
    
    bool accepted;
    
    bool corrected;
    
    bool verified;
}

 
mapping(uint => Submission) public submissions;
   function createSubmission(address _studentsaddress,Student memory _student, Examiner memory _examiner, Thesis memory _thesis) public{
    SubCount ++; 
    submissions[SubCount] = Submission(SubCount,_studentsaddress, _student, _examiner, _thesis, false, false, false); 
    emit SubmissionCreated(SubCount, _studentsaddress, _student, _examiner, _thesis, false, false, false);
}