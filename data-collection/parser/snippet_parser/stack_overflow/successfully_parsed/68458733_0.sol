
pragma solidity >=0.4.22 <0.9.0;
contract Bloc {

struct Task {
    bool status;
    string task;
}



mapping (address => Task[]) public todo_list;

Task[] public todo_arr;

function read_task(uint user_index) public view returns (string memory) {
    return todo_list[msg.sender][user_index].task;
}

function add_task(string memory task) public { 
    
    
    Task memory new_task = Task(false, task);
    todo_list[msg.sender].push(new_task);
}

function update_task(uint idx, bool new_status) public {
    todo_list[msg.sender][idx].status = new_status;
}


function delete_task(uint idx) public {
    delete todo_list[msg.sender][idx];
}

function get_task_count() public view returns (uint) {
    return todo_list[msg.sender].length;
}
}
