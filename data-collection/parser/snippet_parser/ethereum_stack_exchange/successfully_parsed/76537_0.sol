import "./User.sol";

contract Main is Ownable {

    User[] private _users;

    function createUser(uint256 _id) onlyOwner external {
        
        

        
        User user = new User(_id);

        emit UserCreated(user, _users.length);

        _users.push(user);
    }
}
