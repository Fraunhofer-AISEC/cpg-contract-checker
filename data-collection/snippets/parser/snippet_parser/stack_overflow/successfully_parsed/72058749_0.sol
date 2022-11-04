

pragma solidity >=0.7.0 <0.9.0;

contract studentRecord
{
    address owner;

    constructor()
    {
        owner = msg.sender;
    }

    struct student
    {
        string Name;
        string Address;
        string Phone_Num;
        uint16 Roll_Num;
        string DOB;
        uint8 Sem;
        uint8 CGPA;
        string Uni_Name;
    }

    student[] public StudentRecord;

    function setStudentRecords(string calldata _name, string calldata _address, string calldata _phoneNumber, uint16 _rollNumber,
                              string calldata _DOB, uint8 _sem, uint8 _CGPA, string calldata _UniName) public
    {
        uint len = StudentRecord.length;
        StudentRecord[len].Name = _name;
        StudentRecord[len].Address = _address;
        StudentRecord[len].Phone_Num = _phoneNumber;
        StudentRecord[len].Roll_Num = _rollNumber;
        StudentRecord[len].DOB = _DOB;
        StudentRecord[len].Sem = _sem;
        StudentRecord[len].CGPA = _CGPA;
        StudentRecord[len].Uni_Name = _UniName;
    }

    function GetStudentRecord(uint index) public view returns(student memory)
    {
        return StudentRecord[index];
    }

    function studentCount() public view returns(uint)
    {
        return StudentRecord.length;
    }
}
