function getStudents(string name) public view returns(uint256,string){
    require(!isStudent[name]);
    Students storage student = studentsMappig[name];
    return (student.amount, student.givenFor);
}   
