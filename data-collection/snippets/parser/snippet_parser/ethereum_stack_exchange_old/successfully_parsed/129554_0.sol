pragma solidity ^0.8.0 ;
contract PostCounter{
struct Counter{
    uint noOfCounters;
    mapping(address => bool) count;
}
Counter[] public counts;
function likeCounter(uint _likesNo)  public {
    Counter storage thisCounter=counts[_likesNo];
    require(thisCounter.count[msg.sender]==false,"you have already like this post");
    thisCounter.count[msg.sender]=true;
    thisCounter.noOfCounters++;
}
function dislikeCounter(uint _likesNo)  public{
    Counter storage thisCounter=counts[_likesNo];
    require(thisCounter.count[msg.sender]==false,"you have already dislike this post");
    thisCounter.count[msg.sender]=true;
    thisCounter.noOfCounters--;
}
}