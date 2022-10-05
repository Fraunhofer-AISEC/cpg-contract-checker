event DidSomething(uint taskId);

function doSomething(uint _taskId) {
  taskId = _taskId;
  emit DidSomething(taskId);
}
