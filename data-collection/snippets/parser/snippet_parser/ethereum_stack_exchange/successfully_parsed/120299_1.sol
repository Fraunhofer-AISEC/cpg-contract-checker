function addMarks(uint256 Id, string memory Ans) public {
        Student = students[Id];
        Student.Answers = Ans;
        student.push(Id) -1;        
    }  
