contract Users {
    address public owner;
    mapping(address => uint256) public roles;

    constructor() {
        owner = msg.sender;
    }

    function getRole(address _user) external view returns (uint256) {
        return roles[_user];
    }

    function setRole(address _user, uint256 _role) external {
        require(msg.sender == owner, "illegal caller");
        roles[_user] = _role;
    }
}
