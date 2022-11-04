contract ManageMembers {

  address[] members;

  function AddMember(bytes32 name) public returns(address) {
    address member = new Contract(name);
    members.push(member);
    return member;
  } 
}

contract Contract {
  bytes32 public Name;

  function Contract(bytes32 name) public {
    Name = name;
  }
}
