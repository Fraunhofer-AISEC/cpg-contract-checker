import "./IUser.sol";  
contract User {
    address[] userList;
    function addUser (address a) returns (bool) {
        userList.push(a);
    }
}