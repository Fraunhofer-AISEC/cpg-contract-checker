pragma solidity ^0.8.4;
 ...

contract BookVotes{

  uint totalReviews;
  mapping(address => mapping(uint => int)) public bookVotes;
  
 ...

 function createReview(string memory _message, string memory _title) public {
   ...
   bookVotes[msg.sender][totalReviews] = 1;
   totalReviews += 1;
 }

 ...

 function getReviews(uint reviewId) public view returns(int){
  return bookVotes[msg.sender][reviewId];
 }

}

