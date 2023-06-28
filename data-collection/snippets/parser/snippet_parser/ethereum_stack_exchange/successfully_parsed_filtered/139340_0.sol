pragma solidity >=0.4.21 <0.7.0;

contract Bid{

    mapping(string=>uint) propertyVoteCount;
    mapping(string=>mapping(string => bool)) propertyUserVoted;
    
    function vote(string memory propertyId, string memory userId)public returns (bool){
        require(propertyVoteCount[propertyId]<10, "Bidding is Over");
        mapping (string => bool) storage userIds = propertyUserVoted[propertyId];
        require(!userIds[userId], "User has already voted");
        propertyVoteCount[propertyId]++;
        userIds[userId] = true;
        propertyUserVoted[propertyId] = userIds; 

    }
}
