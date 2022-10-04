pragma solidity ^0.4.17;


import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract TodoList is Ownable {

    event NewTodo(uint todoId, string value);
    event DeleteTodo(uint todoId, string value);

    
    mapping(uint => address) todoOwner;
    
    mapping(address => uint) ownerTodoCount;

    TodoItem[] public todoItems;

    struct TodoItem {
        string value;
        bool active;
    }

    function createTodo(string _value) public returns(uint) {
        uint id = todoItems.push(TodoItem(_value, true)) - 1;
        todoOwner[id] = msg.sender;
        ownerTodoCount[msg.sender]++;
        NewTodo(id, _value);
        return id;
    }
}
