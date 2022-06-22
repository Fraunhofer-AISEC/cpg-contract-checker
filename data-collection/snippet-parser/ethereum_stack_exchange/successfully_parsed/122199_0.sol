contract AccessControl {

    uint256 ADMIN_ROLE = 0;
    uint256 WHITELISTER_ROLE = 1;
    uint256 BLACKLISTER_ROLE = 2;

    mapping(uint256 => mapping(address => bool)) _roles;

    constructor() {
        _roles[ADMIN_ROLE][msg.sender] = true;
    }

    function setRole(uint256 role, address user, bool active) requiresRole(ADMIN_ROLE) {
        _roles[role][user] = active;
    }

    modifier requiresRole(uint256 role) {
        require(_roles[role][msg.sender], "AccessControl: Caller not allowed");
        _;
    }

}
