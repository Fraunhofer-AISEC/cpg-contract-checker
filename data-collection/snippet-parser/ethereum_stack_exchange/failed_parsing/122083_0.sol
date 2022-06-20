contact MyContract {
  mapping(address => MyChildContract[]) private children;

  function createChild(string memory name) public {
    MyChildContract child = new MyChildContract(name);
    children[msg.sender].push(child);
  }

  function getMyChildren() public view returns (MyChildContract[] memory myChildren) {
    return children[msg.sender];
  }
}
