function setStudents(string name, uint _amt, string _reason) public{
    Students storage student = studentsMappig[name];
    totalTokens -= _amt;
    student.amount += _amt;
    student.givenFor = _reason;
    if(!isStudent[name]){
        studentsArray.push(string);
        isStudent[name] = true;
    }
    emit transaction(_address, _amt, _reason);
}   
