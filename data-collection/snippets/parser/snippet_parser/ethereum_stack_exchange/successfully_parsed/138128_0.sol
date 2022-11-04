contract Todo {

 mapping(address => string[]) todos;


function addTodo(string memory _todo) public{
    todos[msg.sender].push(_todo);
}

function delTodo(uint idx) public{
    require(idx < todos[msg.sender].length);
    delete todos[msg.sender][idx];
    todos[msg.sender][idx] = todos[msg.sender][todos[msg.sender].length - 1];
    todos[msg.sender].pop();

}

function showTodo() public view returns(string[] memory){
    return(todos[msg.sender]);
}
}