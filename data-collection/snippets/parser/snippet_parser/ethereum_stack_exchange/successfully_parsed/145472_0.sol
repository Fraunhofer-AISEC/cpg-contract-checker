    

pragma solidity ^0.8.7;

contract Launchpad {

    uint256 projectId;

    
    mapping(string => uint) public projectNameToProjectId;

    struct Projects {
        uint projectId;
        string projectName;
    }

    Projects[] public project;

    function addProjectDetails (uint _projectId ,string memory _projectName) public {
        projectNameToProjectId[_projectName] = _projectId;
        project.push(Projects(_projectId, _projectName));
    }

    function getStringToUint(string memory key) public view returns (uint) {
        return projectNameToProjectId[key];
    }
}

contract StringToUintMapping {
    mapping(string => uint) stringToUintMap;

    function setStringToUint(string memory key, uint value) public {
        stringToUintMap[key] = value;
    }

    function getStringToUint(string memory key) public view returns (uint) {
        return stringToUintMap[key];
    }
}
