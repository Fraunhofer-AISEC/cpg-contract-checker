
pragma solidity ^0.8.7;

contract ProjectTaskList {
    
    struct Task {
        string project;
        string title;
        string description;
        bool isCompleted;
        uint256 dueDate;
        address assignedUser;
        uint256 payment;
        address owner;
    }

    Task[] public _taskList;
    mapping(address => uint256[])  _userTasks;
    mapping(string => uint256[] )  _projectTasks;

    function getContractBalance() public view returns (uint256){
        return address(this).balance;
    }

    function addToDo(string memory project, string memory title, string memory description, uint256 dueDate, address assignedUser) public payable {
        require(bytes(project).length > 0, "Project is required");
        require(bytes(title).length > 0, "Title is required");
        require(bytes(description).length > 0, "Description is required");
        require(dueDate > 0, "DueDate is required");
        require(assignedUser != address(0), "Assigned User is required");

        uint256 newIndex = _taskList.length;
        _taskList.push(Task(project, title, description, false, dueDate, assignedUser, msg.value, msg.sender));
        _userTasks[assignedUser].push(newIndex);
        _projectTasks[project].push(newIndex);
    }

    function getUserTasks(address user) public view returns (uint256[] memory){
        return _userTasks[user];
    }

    function geProjectTasks(string memory projectName) public view returns (uint256[] memory){
        return _projectTasks[projectName];
    }

    function updateTask(uint256 index, string memory project, string memory title, string memory description, uint256 dueDate, address assignedUser){
        require(bytes(project).length > 0, "Project is required");
        require(bytes(title).length > 0, "Title is required");
        require(bytes(description).length > 0, "Description is required");
        require(dueDate > 0, "DueDate is required");
        require(assignedUser != address(0), "Assigned User is required");

        Task foundTask = _taskList[index];
        require(foundTask.owner == msg.sender, "You do not have the right to update this task");
        
        
    }
}