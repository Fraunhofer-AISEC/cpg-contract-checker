pragma solidity ^0.4.6;

contract Project {

    struct projectInfo {
        address projectOwner;
        string name;
        uint248 amountToRaise;
        uint248 deadline;
    }

    projectInfo public info;

    function Project(string name, uint248 amountToRaise, uint248 deadline) {
        info = projectInfo(tx.origin, name, amountToRaise, deadline);
    }

    

    
    function getName() public constant returns (string) {
        return info.name;
    }

    function getOwner() public constant returns (address) {
        return info.projectOwner;
    }

    function getAmount() public constant returns (uint248) {
        return info.amountToRaise;
    }

    function getDeadline() public constant returns (uint248) {
        return info.deadline;
    }
}
