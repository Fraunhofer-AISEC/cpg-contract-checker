uint public studentsCounter;

mapping (uint => mapping (address => student)) public Info;

function addInfo(student memory _student, address _address) public returns(uint){
    require(owner == msg.sender, "Only admin can add Info!!!");
    Info[studentsCounter][_address] = _student;
    studentsCounter++;
    student_Info.push(_address);
    return studentsCounter-1;
}
