pragma experimental ABIEncoderV2;
pragma solidity 0.5;
contract userID{

struct user {
    uint256 uid;
    bytes32 item;
} 

mapping (uint256 => user[]) public  users;

function sendReview(uint256 _uid, bytes32 _item) public{
    user memory newUser = user(_uid,_item);
    users[_uid].push(newUser);
}

function getitem(uint256 _uid) public view returns(user[] memory){
    return(users[_uid]);

}

}
