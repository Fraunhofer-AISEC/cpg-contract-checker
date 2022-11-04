pragma solidity 0.6.6;

contract Friends {

    mapping(address => address[]) innerList;
    
    function addFriend(address owner, address friend) public {
      innerList[owner].push(friend);
    }
    
    function getFriends(address owner) public returns(address[] memory){
        return innerList[owner];
    }
}
