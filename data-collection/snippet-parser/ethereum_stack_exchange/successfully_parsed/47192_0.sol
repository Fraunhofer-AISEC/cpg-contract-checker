pragma solidity ^0.4.2;

contract AddressRatings {

struct Rating {
    mapping ( address => uint8 ) ratings;
    uint256 amtOfRatings;
    uint256 sumOfRatings;
    uint8 average;
}

mapping ( address => Rating ) public ratings;

function rateAddress (address _addr, uint8 _rating) external {
    require(_rating > 0 && _rating < 6); 
    require(ratings[_addr].ratings[msg.sender] == 0); 
    ratings[_addr].ratings[msg.sender] = _rating;
    ratings[_addr].amtOfRatings++;
    ratings[_addr].sumOfRatings += _rating;
    ratings[_addr].average = uint8(ratings[_addr].sumOfRatings/ratings[_addr].amtOfRatings);
}

}
