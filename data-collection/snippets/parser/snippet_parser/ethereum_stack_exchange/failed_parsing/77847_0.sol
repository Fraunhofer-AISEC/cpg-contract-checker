string memory professorsExamHash = professorsExam[msg.sender];  
if(professorsExamHash == 0x0){
    return "No exam hash asociated with this professor address";
}
