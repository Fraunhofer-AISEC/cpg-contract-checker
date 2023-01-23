Contract.sol


uint256 internal studentCount = 0;


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

event SetData(string message); 


constructor () {
   
   Owner = payable(msg.sender);        

}


  function setData(
string memory _name,
uint _age,
string memory _IdentityCard,
string memory _FathersInitial,
string memory _DateOfBirth,
string memory _MailingAddress,
uint _PhoneNumber,
string memory _Country,
string memory _Nationality) public returns (uint256) {
   

   
   StudentInfo memory tx1 = StudentInfo(
       _name,
       _age,
       _IdentityCard,
       _FathersInitial,
       _DateOfBirth,
       _MailingAddress,
       _PhoneNumber,
       _Country,
       _Nationality );
   StudentInfoArray.push(tx1);
   studentCount ++;
   students[msg.sender] = studentCount;
   
   emit SetData("Congratulations you have set your data");
   
   return studentCount;
}

modifier onlyOwner() {
       require(Owner == msg.sender, "Ownable: caller is not the owner");
       _;
   }
function getStudent(uint studentID) public view returns(StudentInfo memory) {
   return StudentInfoArray[studentID-1];
}
