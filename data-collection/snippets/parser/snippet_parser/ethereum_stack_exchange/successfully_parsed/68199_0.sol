contract students{
uint public totalTokens;
constructor() public {
    totalTokens = 800;
}
struct Students{
    uint amount; 
    string givenFor;
}

mapping (string => Students) studentsMappig;

string[] private studentsArray;

function setStudents(string _name, uint _amt, string _reason) public{
    Students storage student = studentsMappig[_name];
    totalTokens -= _amt;
    student.amount += _amt;
    student.givenFor = _reason;
    studentsArray.push(_name);
}
function getDetails(string addr) public view returns(uint amount) {
    Students storage student = studentsMappig[addr];
    return amount = student.amount;
}   
function getUsersCount() public view returns(uint) {
    return studentsArray.length;
}    
}
