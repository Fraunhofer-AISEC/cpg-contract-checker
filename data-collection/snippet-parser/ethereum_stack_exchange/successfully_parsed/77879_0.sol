function addExam(string memory hash) public returns (string memory examProfessorHash) {
    
    professorsExam[msg.sender] = hash;

    return professorsExam[msg.sender];
}
