contract Manager {
    using Roles for uint256;

    Users public users;

    constructor(Users _users) public {
        users = _users;
    }

    function isAuthorizedToRole1(address _user) external view returns (bool) {
        return users.getRole(_user).isAuthorizedToRole1();
    }

    function isAuthorizedToRole2(address _user) external view returns (bool) {
        return users.getRole(_user).isAuthorizedToRole2();
    }

    function isAuthorizedToRole3(address _user) external view returns (bool) {
        return users.getRole(_user).isAuthorizedToRole3();
    }
}
