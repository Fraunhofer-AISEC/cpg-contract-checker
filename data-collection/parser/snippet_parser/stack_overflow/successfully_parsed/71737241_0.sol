
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract ToDoList {
    constructor() public {
        addTask("Tache initiale");
    }

    struct Task {
        uint256 id;
        string description;
        bool completed;
    }

    mapping(address => Task[]) public tasks;

    function addTask(string memory _description) public {
        uint256 id = uint256(
            keccak256(abi.encodePacked(msg.sender, _description))
        );

        tasks[msg.sender].push(
            Task({id: id, description: _description, completed: false})
        );
    }

    function changeTaskStatus(uint256 _id, bool _status) public {
        for (uint256 i = 0; i < tasks[msg.sender].length; i++) {
            if (tasks[msg.sender][i].id == _id) {
                tasks[msg.sender][i].completed = _status;
            }
        }
    }

    function removeTask(uint256 _id) public {
        for (uint256 i = 0; i < tasks[msg.sender].length; i++) {
            if (tasks[msg.sender][i].id == _id) {
                delete tasks[msg.sender][i];
            }
        }
    }

    function getTasks() public view returns (Task[] memory) {
        return tasks[msg.sender];
    }

    function tasksCount() public view returns (uint256) {
        return tasks[msg.sender].length;
    }
}