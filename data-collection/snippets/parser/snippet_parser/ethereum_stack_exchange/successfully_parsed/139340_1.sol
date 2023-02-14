pragma solidity >=0.4.21 <0.7.0;

contract Bid{

    mapping(string=>uint) public propertyVoteCount;
    mapping(string=>mapping(string => bool)) public propertyUserVoted;
    
    function vote(string memory propertyId, string memory userId)public returns (bool){
        require(propertyVoteCount[propertyId]<10, "Bidding is Over");
        require(!propertyUserVoted[propertyId][userId], "User has already voted");
        propertyVoteCount[propertyId]++;
        propertyUserVoted[propertyId][userId] = true;
    }
}
