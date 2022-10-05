

pragma solidity ^0.8.4;

contract TodoList {
  struct Todo {
    bytes32 id;
    string title;
    string description;
    bool mark;
  }

  mapping(address => Todo[]) todoLookups;

  event Add(address from, bytes32 _id);
  event Remove(address from, bytes32 _id);
  event Update(address from, bytes32 _id);

  function add(string memory _title, string memory _description) public {
    bytes32 id = keccak256(abi.encodePacked(block.timestamp, todoLookups[msg.sender].length + 1));
    todoLookups[msg.sender].push(Todo(id, _title, _description, false));
    emit Add(msg.sender, id);
  }

  function update(
    bytes32 _id,
    string memory _title,
    string memory _description
  ) public returns (bool) {
    uint256 index = findIndexById(_id);
    Todo memory oldTodo = todoLookups[msg.sender][index];
    todoLookups[msg.sender][index] = Todo(_id, _title, _description, oldTodo.mark);
    emit Update(msg.sender, _id);
    return true;
  }

  function remove(bytes32 _id) public returns (bool) {
    uint256 index = findIndexById(_id);
    todoLookups[msg.sender][index] = todoLookups[msg.sender][todoLookups[msg.sender].length - 1];
    todoLookups[msg.sender].pop();
    emit Remove(msg.sender, _id);
    return true;
  }

  function setMark(bytes32 _id, bool _mark) public returns (bool) {
    uint256 index = findIndexById(_id);
    todoLookups[msg.sender][index].mark = _mark;
    return true;
  }

  function get(bytes32 _id) public view returns (Todo memory item) {
    uint256 index = findIndexById(_id);
    item = todoLookups[msg.sender][index];
  }

  function getAll() public view returns (Todo[] memory items) {
    items = todoLookups[msg.sender];
  }

  function findIndexById(bytes32 _id) internal view returns (uint256) {
    for (uint256 i = 0; i < todoLookups[msg.sender].length; i++) {
      if (todoLookups[msg.sender][i].id == _id) {
        return i;
      }
    }
    revert("not found item by this id");
  }
}

