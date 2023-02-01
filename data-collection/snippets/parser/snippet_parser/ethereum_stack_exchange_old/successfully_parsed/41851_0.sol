struct userData{
     uint val;
     bool isvalue;
     string name;
}



mapping(uint => address) internal users;
mapping(address => userData) internal bidirectionalUsers;

function addMember(address newMember, string memberName) public{

        if (msg.sender != owner) return;

        if (bidirectionalUsers[newMember].isvalue) return;

        users[memberCount] = newMember;
        bidirectionalUsers[newMember] = userData(memberCount,true,memberName);

    }
