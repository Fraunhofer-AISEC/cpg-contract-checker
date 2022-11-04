
pragma solidity >=0.4.22 <0.9.0;

contract Kenesis_v1 {
struct Task {
  string employee_id;
  string employer_name;
  string task_name;
  string task_deadline;
}
uint256 public counter = 0;
mapping (uint256 => Task) public tasks;
uint256[] public employee_ids;

function createTask(string memory employee_id,string memory employer_name,string memory task_name,string memory task_deadline) public {
  
  var employee = tasks[counter];
  employee.employee_id = employee_id;
  employee.employer_name=employer_name;
  employee.task_name=task_name;
  employee.task_deadline=task_deadline;
  employee_ids.push(counter)-1;
  counter++;

}

}
