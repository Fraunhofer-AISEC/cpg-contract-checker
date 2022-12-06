function getTodo(string memory _name, uint _age) external pure returns(Todo memory) {
        Todo memory myTodo = Todo(_name, _age);
        return myTodo;
}
