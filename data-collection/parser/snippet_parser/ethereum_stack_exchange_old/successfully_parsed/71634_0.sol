contract NameAssignment {

    string public name;

    function addName(string calldata _name) external {
      name = _name;
    }
}
