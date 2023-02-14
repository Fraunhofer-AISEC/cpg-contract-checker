import "./User.sol";

contract Main is Ownable {

    User[] private _users;
    mapping(uint256 => bool) userExists;

    function createUser(uint256 _id) onlyOwner external {
        require(!userExists[_id], "User already exists.");
        userExists[_id] = true;

        User user = new User(_id);

        emit UserCreated(user, _users.length);

        _users.push(user);
    }
}
