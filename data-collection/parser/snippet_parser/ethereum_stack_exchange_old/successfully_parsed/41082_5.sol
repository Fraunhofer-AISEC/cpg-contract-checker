   function setStudent (uint _age, uint _income, uint _score, uint _attendance) public {
        
        students.push(Student({age: _age, income: _income, score: _score, attendance: _attendance}));
    }
