pragma solidity ^0.8.17;

contract StudentData 
{
    struct StudentInfo
    {
        uint roll;
        string name;
        uint cgpa;
        bool placed;
    }

    address public admin;

    constructor() public
    {
        admin = msg.sender;
    }

    mapping(address => StudentInfo) studentdata;

    mapping(address => bool) studentaddress;

    mapping(address => bool) guestaddress;

    function RegAsStudent(address _addr) public 
    {
        require(_addr != admin, "Admin can't Register As Student. ");
        studentaddress[_addr] = true;
    }

    function RegAsGuest(address _addr) public payable {
        require(studentaddress[_addr] != true, "Students are not allowed to Register as Guest Viewers. ");
        require(msg.value == 1 ether, "Please Transfer Exact Amount to get Access.");
        guestaddress[_addr] = true;
    }

    function InputData
    (address _key, 
    uint _roll, 
    string memory _name, 
    uint _cgpa, 
    bool _placed) public 
    {
        require(_key != admin, "Change Account to feed Student's Data.");
        require(studentaddress[_key] == true, "You are not a Student! ");
        StudentInfo memory data = StudentInfo(_roll, _name, _cgpa, _placed);
        studentdata[_key] = data;
    }

    function DisplayData(address _key) public view returns (StudentInfo memory) {
        require(msg.sender == admin || studentaddress[msg.sender] == true,
        "Only Admin & Students can access the Data. ");
        return studentdata[_key];
    }

    function ViewAsGuest(address _key) public view returns (StudentInfo memory) {
        require(guestaddress[msg.sender] == true, "Only Paid Guests can Access.");
        return studentdata[_key];
    }
}
