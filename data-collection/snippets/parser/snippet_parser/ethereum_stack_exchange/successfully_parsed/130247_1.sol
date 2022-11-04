
pragma solidity ^0.8.0;

contract Test {

    enum status { Set, Done }
    task[] TaskList;

    struct task {
        string description;
        status taskStatus;
        address assignedTo;
        uint deadline;
        mapping (address => bool) allocation;
    }
    

    function setTask (string memory _desc , address[] calldata _copartner , uint _deadline) external  {
        task storage t = TaskList.push();
        t.description = _desc;
        t.taskStatus = status.Set;
        t.assignedTo = msg.sender;
        t.deadline = block.timestamp + _deadline;
        t.allocation[msg.sender] = true;
    }
} 
