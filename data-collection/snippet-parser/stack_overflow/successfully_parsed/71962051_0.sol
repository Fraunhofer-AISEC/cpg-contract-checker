    struct Todo {
    string name;
    uint age;
}

function createTodo(string memory _name, uint _age) public pure{
    Todo memory myTodo = Todo(_name, _age);

}
