enum Status {
    Active,
    Inactive
}
struct Member {
    string name;
    Status status;
}
Member[] public members;
uint256 public membersCount;

function addMember(string memory _name) external {
    Member memory member = Member(_name, Status.Active);
    members.push(member);
    membersCount++;
}


function setMemberInactive(uint256 index) external {
    Member storage member = members[index];
    member.name = "Jeremy";
    member.status = Status.Inactive;
}
