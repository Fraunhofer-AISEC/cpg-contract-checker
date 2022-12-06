contract Register {

    

    struct User {
        address userAddress;
        string nickname;
        string email;
        string password;
        bool isLoggedIn;
    }
    mapping(address => User) users;
    address public creator;
    

    function Register() {
        creator = msg.sender;
    }


    function setAccountInfo(string nickname, string email, string password, address addr) {
        users[addr].nickname = nickname;
        users[addr].email = email;
        users[addr].password = password;
    }

    function getNickname(address addr) returns (string) {
        return users[addr].nickname;
    }

    function getEmail(address addr) returns (string) {
        return users[addr].email;
    }

    function getAddress() constant returns (address) {
        return creator;
    }

    function setLoggedStatus(address addr, bool condition) {
        users[addr].isLoggedIn = condition;
    }

    function getLoggedStatus(address addr) constant returns (bool success) {
        return users[addr].isLoggedIn;
    }

}
