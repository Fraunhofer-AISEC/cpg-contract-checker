contract ArrayStruct {

    struct User {
        uint idNum;
        string name;
        address userAddress;
    }

    User[] public users;

    function addUser(uint _idNum, string _name, address _userAddress) public returns(uint) {
        users.length++;
        users[users.length-1].idNum = _idNum;
        users[users.length-1].name = _name;
        users[users.length-1].userAddress = _userAddress;
        return users.length;
    }

    function getUsersCount() public constant returns(uint) {
        return users.length;
    }

    function getUser(uint index) public constant returns(uint, string, address) {
        return (users[index].idNum, users[index].name, users[index].userAddress);
    }
}
