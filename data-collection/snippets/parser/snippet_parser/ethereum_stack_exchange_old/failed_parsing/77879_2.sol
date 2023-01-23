event ExamAdded(string hash);

function addExam(string memory hash) public returns (string memory examProfessorHash) {
    
    professorsExam[msg.sender] = hash;
    emit ExamAdded(professorsExam[msg.sender]);
    return professorsExam[msg.sender];
}
