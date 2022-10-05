function studentAddExam(address studentAddress) public returns (string memory returnString){
    
    
    string memory professorsExamHash = professorsExam[msg.sender];  
    Exam storage examObj = examHash[professorsExamHash];
    examObj.examSuccess[studentAddress] = true;
    return professorsExamHash;
}
