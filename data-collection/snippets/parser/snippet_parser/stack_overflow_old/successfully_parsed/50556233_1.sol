pragma solidity ^0.4.18;

contract Test{

struct User{
    uint cardId;
    uint cardCount;
}
address user_address;

mapping (address => User) public Users;

function add_user() public {
    user_address = msg.sender ;
    var new_user = Users[user_address];
    new_user.cardId =2;
    new_user.cardCount = 50;
}

function get() public returns(uint,uint)
{
    return(Users[user_address].cardId,Users[user_address].cardCount);
}


}
