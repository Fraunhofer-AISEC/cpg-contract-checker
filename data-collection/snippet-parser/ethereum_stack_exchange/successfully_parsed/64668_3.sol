pragma solidity ^0.4.24;

contract Dao {

    mapping (address => User) public users;

    struct User {
        address addr;
        string name;
        uint balence;
        uint8 flag;
    }

    function addUser(address _address, string _name, uint _balence, uint8 _flag) public {
        users[msg.sender].name = _name;
        users[msg.sender].flag = _flag;
        users[msg.sender].addr = _address;
        users[msg.sender].balence = _balence;
    }

    function addToBalence(string name) public payable{
        if(users[msg.sender].flag != 1) addUser(msg.sender,name,0,1);
        users[msg.sender].balence = users[msg.sender].balence + msg.value;
    }

    function showBalence() public returns (uint) {
        return users[msg.sender].balence;
    }

    function withdraw(uint amount) public payable{
        if(users[msg.sender].flag != 1) revert("user does not exist");
        else if (users[msg.sender].balence >= amount){
            msg.sender.call.value(amount)();
            users[msg.sender].balence -= amount;
        }
    }
}

contract Hacker {
    Dao dao;
    address userAddress; 
    string userName;

    constructor(string _userName, address daoAddress) public {
        dao = Dao(daoAddress);
        userAddress = msg.sender;
        userName = _userName;
    }

    function addToBalence(string name, uint amount) public payable {
        dao.addToBalence.value(msg.value)(userName); 
    }
}
