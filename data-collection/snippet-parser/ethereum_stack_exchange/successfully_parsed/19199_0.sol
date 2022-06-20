pragma solidity ^0.4.11;

contract EmployeeDir{
    uint public id;
    string public name;
    address public currentVersion;
    address public owner;

    struct employee{
        string name;
        uint days_present;
    }

    mapping (uint => employee) public dir;

    
    function EmployeeDir(string _name, address _versionAddr){
        dir[id].name = _name;
        currentVersion = _versionAddr;
        owner = msg.sender;
    }

    function updateVersionAddress(address _versionAddr){
        if(msg.sender == owner)
            currentVersion = _versionAddr;
    }

    function addEmployee(string _name){
        if(msg.sender == owner){
            
            
            
            currentVersion.delegatecall(bytes4(sha3("addEmployee(string)")), _name);

            dir[id].name = name;
        }
    }
}

contract Code{
    uint public id;
    string public name;

    function addEmployee(string _name){
        id += 1;
        name = _name;
    }
}
