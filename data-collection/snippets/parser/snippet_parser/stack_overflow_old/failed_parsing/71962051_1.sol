 function getTodo(string memory _name, uint _age) public returns(struct myTodo) {
    Todo memory myTodo = Todo(_name, _age);
    return myTodo;

}
