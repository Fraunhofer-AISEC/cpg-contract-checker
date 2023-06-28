

pragma solidity ^0.8.7;

contract Launchpad {

    uint256 private projectId;

    mapping(string => uint256) public projectNameToProjectId;

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
        return (projectNameToProjectId[key]);
    }
}
