
pragma solidity ^0.8.12;

contract modifierExample{

    address admin ;

    constructor() public {
        admin == msg.sender;
    }

    modifier isAdmin {
        require(admin == msg.sender,"you are not the owner");
        _;
    }

    modifier isExp(uint exp) {
        if(exp >= 5)
        _;
        else
        revert("you are not experienced");
    }

    struct employeeDetails{
        uint iD;
        string name;
        uint age;
    }

    mapping (uint => employeeDetails) getDetailsByNum;

    function enterDetails(uint number,
                          uint iD,
                          string memory name,
                          uint age) public isAdmin isExp(5) {
                              employeeDetails memory EmployeeDetails = employeeDetails(iD,name,age);
                              getDetailsByNum[number] = EmployeeDetails;
                          }

    function getDetailsByNumber(uint number) public view returns (employeeDetails memory) {
        return getDetailsByNum[number];
    }

}
