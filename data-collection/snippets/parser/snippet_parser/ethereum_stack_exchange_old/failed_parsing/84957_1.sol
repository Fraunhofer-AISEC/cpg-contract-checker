pragma solidity >=0.5.0 <0.6.0 ;

contract TodoList {
    uint public taskCount = 0;
}

 struct Task {
    uint id;
    string content;
    bool completed;
}

mapping(uint => Task) public tasks;

event TaskCreated(uint id,string content,bool completed);
event TaskToggled(uint id,bool completed);

construct() public {
    createTask("Default Todo Task");
}

function createTask(string memory _content) public{
    taskCount ++;
    tasks[taskCount]=Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
}

function toggleTask(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskToggled(_id, _task.completed);
}
