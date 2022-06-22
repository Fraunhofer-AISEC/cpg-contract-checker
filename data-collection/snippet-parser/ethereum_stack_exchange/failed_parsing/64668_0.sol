pragma solidity ^0.4.24;
contract Dao {
struct User {
    address addr;
    string name;
    uint balence;
    uint8 flag;
}
....
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
