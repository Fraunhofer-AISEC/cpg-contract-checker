pragma solidity 0.5;
contract userID{
 
mapping (uint256 => bytes32[]) public  users;

function sendReview(uint256 _uid, bytes32 _item) public{
    users[_uid].push(_item);
}

function getitem(uint256 _uid) public view returns(bytes32[] memory){
    return(users[_uid]);
    
}

}
