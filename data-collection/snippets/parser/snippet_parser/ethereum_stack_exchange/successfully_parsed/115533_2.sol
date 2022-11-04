
pragma solidity >=0.4.22 <0.9.0;

contract TodoList {

  uint public taskCount = 0;

  mapping(uint => Task) public tasks;

  struct Task {
    uint id;
    string content;
    bool completed;
    bool exists;
  }

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskDeleted(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  constructor() {
    createTask("Check out dappuniversity.com");
  }

  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false, true);
    emit TaskCreated(taskCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    require(tasks[_id].exists, "Task does not exist");
    tasks[_id].completed = !tasks[_id].completed;
    emit TaskCompleted(_id, tasks[_id].completed);
  }

  function deleteTask(uint _id) public {
    require(tasks[_id].exists, "Task does not exist");
    tasks[_id].exists = false;
    emit TaskDeleted(_id, tasks[_id].content,tasks[_id].completed);
  }
}
