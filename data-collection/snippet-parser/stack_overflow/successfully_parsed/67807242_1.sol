constructor() public{
PopulateStudent("string", "string", int, int)
Fill();
}
function PopulateStudent(string memory _name, string memory _surname, uint _exam, uint _center) public { 
students[1] = Student({name :_name, surname: _surname, examNumber: _exam, center:_center, qualification:Qualification.Bachelor, level:Level.one});
}
