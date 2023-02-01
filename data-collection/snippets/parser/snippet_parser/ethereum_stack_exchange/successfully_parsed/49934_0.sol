

address owner = msg.sender;
bool ifmember;
mapping(address => bool) members;

modifier onlyMember {
    require(msg.sender == owner || members[msg.sender] == true);
    _;
    }

function addMember(address _address) public onlyMember {
    ifmember = members[_address];
    }


