pragma solidity ^0.4.6;

import "Project.sol";

contract FundingHub {

    address public owner;
    address[] public projectAddresses;

    modifier onlyOwner() { if (msg.sender != owner) throw; _; }

    function FundingHub() {
        owner = msg.sender;
    }

    function createProject(string name, uint248 amountToRaise, uint248 deadline) returns (address) {
        address newProject = new Project(name, amountToRaise, deadline);
        projectAddresses.push(newProject);
        return newProject;
    }

    function getProjectAddress(uint i) constant returns (address projectAddress) {
        return projectAddresses[i];
    }

    function killMe() onlyOwner returns (bool successful) {
        suicide(owner);
        return true;
    }
}
