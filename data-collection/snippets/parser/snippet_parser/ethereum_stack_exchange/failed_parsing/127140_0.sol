pragma solidity >=0.8.1;

struct AppStorage {
    uint96 applicationCount;
    mapping(uint96 => Application) applications;
    mapping(address => mapping(address => bool)) applicantGrant;
    mapping(uint96 => mapping(uint48 => MilestoneState)) applicationMilestones;
    mapping(uint96 => Workspace) workspaces;
    mapping(uint96 => mapping(address => bytes32)) memberRoles;
    }
library LibAppStorage{
function blabla.....
}
