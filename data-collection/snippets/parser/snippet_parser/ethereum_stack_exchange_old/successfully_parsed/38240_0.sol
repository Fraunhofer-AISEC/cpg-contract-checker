pragma solidity ^ 0.4.17;

contract TodoList {

    event NewTodo(uint todoId, string value);
    event DeleteTodo(uint todoId, string value);

    mapping(uint => address) public todoOwner;
    mapping(address => uint) ownerTodoCount;

    TodoItem[] public todoItems;

    struct TodoItem {
        string value;
        
        bool active;
    }

    function createTodo(string _value) internal returns(uint) {
        uint id = todoItems.push(TodoItem(_value, true)) - 1;
        todoOwner[id] = msg.sender;
        ownerTodoCount[msg.sender]++;
        NewTodo(id, _value);
        return id;
    }

    function getAllTodos() constant returns(string[], bool[]) {
        uint length = todoItems.length;

        string[] memory values = new string[](length);
        bool[] memory actives = new bool[](length);

        for (uint i = 0; i < length; i++) {
            values[i] = todoItems[i].value;
            actives[i] = todoItems[i].active;
        }

        return (values, actives);
    }  
}
