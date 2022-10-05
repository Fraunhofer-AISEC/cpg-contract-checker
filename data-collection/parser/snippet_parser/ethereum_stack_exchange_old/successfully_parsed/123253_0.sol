pragma solidity ^0.8.0;

contract Todo {

    struct TODO {
        string text;
        bool completed;
        address owner;
    }

    TODO[] public todos;

    function create(string memory _text, bool _completed) public {
        todos.push(TODO(_text, _completed, msg.sender));

    }

    constructor() {
        TODO storage todo = todos[0];
        todo.owner = msg.sender;
    }

    function get(uint _index) public view returns(string memory, bool, address) {
        TODO storage todo = todos[_index];
        return(todo.text, todo. completed, todo.owner);
    }



}
