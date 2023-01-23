pragma solidity ^0.8.5;

contract Todo {

 mapping(address => string[]) todos;
 string[]  public allTodos;


function addTodo(string memory _todo) public{
    todos[msg.sender].push(_todo);
    allTodos.push(_todo);
}

function delTodo(uint idx) public{
    require(idx < todos[msg.sender].length);
    string memory _todo = todos[msg.sender][idx];
    delete todos[msg.sender][idx];
    todos[msg.sender][idx] = todos[msg.sender].[todos[msg.sender].length - 1];
    todos[msg.sender].pop();
    for (uint i; i<allTodos.length; i++) {
        if (keccak256(abi.encodePacked(_todo))==keccak256(abi.encodePacked(allTodos[i]))) {
         delete allTodos[i];
    }
  }
}





function showTodo() public view returns(string[] memory){
    return(todos[msg.sender]);
}

}
