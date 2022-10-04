contract StudentContract  {


uint256 internal studentCount = 1;


struct StudentInfo {
string name;    
uint age;
string IdentityCard;
string FathersInitial;
string DateOfBirth;
string MailingAddress;
uint PhoneNumber;
string Country;
string Nationality; 


}

StudentInfo[] internal StudentInfoArray;
string[] internal OtherArray;
address payable public Owner;
mapping (address => uint256) internal students;


   constructor () {
    
    Owner = payable(msg.sender);        

}


event SetData(string message); 

function setData(string memory _name, uint _age, string memory _IdentityCard, string memory _FathersInitial, string memory _DateOfBirth, string memory _MailingAddress, uint _PhoneNumber, string memory _Country, string memory _Nationality) public returns (uint256) {
    
    require(students[msg.sender] == 0, "Data already exist for this wallet");
    
  StudentInfo memory tx1 = StudentInfo(_name, _age, _IdentityCard, _FathersInitial, _DateOfBirth, _MailingAddress, _PhoneNumber, _Country, _Nationality);
  StudentInfoArray.push(tx1);
  students[msg.sender] = studentCount;
  studentCount ++;
    
    
    emit SetData("Congratulations you have set your data");
    
    return studentCount;
    }
function ChangeStudentData(string memory _name, uint _age, string memory _IdentityCard, string memory _FathersInitial, string memory _DateOfBirth, string memory _MailingAddress, uint _PhoneNumber, string memory _Country, string memory _Nationality)public returns(bool success){
  students[studentCount].name;
  students[studentCount].age;
  students[studentCount].IdentityCard; 
  students[studentCount].FathersInitial;
  students[studentCount].DateOfBirth; 
  students[studentCount].MailingAddress;
  students[studentCount].PhoneNumber;
  students[studentCount].Country;
  students[studentCount].Nationality;
 return true;}
}