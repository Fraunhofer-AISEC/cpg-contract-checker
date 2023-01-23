pragma solidity ^0.5.0;

contract student
 {
    string private name;
    string private birthdate;
    string private department;
    string private location;
    string private email;
    uint256 private id;
    uint256 private mobile_no;
    uint256 counter=0;

    function setName(string memory myname) public 
    {
        name=myname;
    }
    function getName() public view returns(string memory )
    {
        return name;
    }

     constructor ()public
    {
        id=counter+1;
        counter=counter+1;
    }
    function getid() public view returns(uint256 id1)
    {
        id1=id;
        return id1;
    }

    function setbirthdate(string memory _birthdate) public 
    {
        birthdate = _birthdate;
    }

    function getbirthdate() public view returns(string memory )
    {
        return birthdate;
    }

    function setdepartment(string memory mydepartment) public
    {
        department = mydepartment;   
    }
    function getdepartment() public view returns(string memory )
    {
        return department;
    }
    function setlocation(string memory mylocation) public
    {
        location= mylocation;   
    }
    function getlocation() public view returns(string memory )
    {
        return location;
    }

    function setmobileno(uint256 myphonenumber) public
    {
        mobile_no = myphonenumber;
    }
    function getmobileno() public view  returns(uint256 )
    {
        return mobile_no;
    }


 }
