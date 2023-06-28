uint256 newIndex = _taskList.length;
 _taskList.push(Task(project, title, description, false, dueDate, assignedUser, msg.value, msg.sender));
_userTasks[assignedUser].push(newIndex);
_projectTasks[project].push(newIndex);
