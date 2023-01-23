mapping(address => bool) members;

function addMember(address _address) public {
 require(members[_address] == false, "Member is already listed");
 members[_address] == true;
}

function removeMember(address _address) public {
 require(members[_address] == true, "Address is already out");
members[_address] == true;
}

function memberStatus(address _address) public returns(bool){
 return members[_address];
}
