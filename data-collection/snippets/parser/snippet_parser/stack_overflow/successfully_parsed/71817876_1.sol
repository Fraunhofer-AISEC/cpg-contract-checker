pragma solidity 0.5.16;
contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string description;
        bool complete;
    }

    event TaskCreated(uint256 id, string content, bool completed);

    mapping(uint256 => Task) public tasks;

    constructor() public {
        addTask("Morning Coffee");
    }

    function addTask(string memory _description) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _description, false);
        emit TaskCreated(taskCount, _description, false);
    }
}
