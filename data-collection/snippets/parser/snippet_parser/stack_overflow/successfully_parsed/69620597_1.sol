
function add_task(string memory _name) public {
    
    tasksStruct memory newTask = tasksStruct(_name, uint32(now), false);
    tasks.push(newTask);
}
