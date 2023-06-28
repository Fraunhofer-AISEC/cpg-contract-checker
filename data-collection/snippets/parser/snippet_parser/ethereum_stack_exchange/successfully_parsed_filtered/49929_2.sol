contract Autos {
    address owner; 

    bool ifmember;
    mapping(address => bool) members;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyMember {
        require(msg.sender == owner || members[msg.sender] == true);
        _;
    }
    function addMember(address _address) public onlyMember {
        ifmember = members[_address];
    }
}
