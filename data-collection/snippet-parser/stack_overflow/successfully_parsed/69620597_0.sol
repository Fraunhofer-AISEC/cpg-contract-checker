contract task_list {

    struct tasksStruct {
        string name;
        uint32 timestamp;
        bool is_done;
    }

    tasksStruct[] tasks;

    function add_task(string _name) public {
        tasksStruct newTask = tasksStruct(_name, now, false);
        tasks.push(newTask);
    }
    function show_opened_tasks() public view returns (uint) {
        uint count_of_opened_tasks = 0;
        for (uint i=0; i<tasks.length; i++){
            if (!tasks[i].is_done) {
                count_of_opened_tasks += 1; 
            }
        }
    }
}
