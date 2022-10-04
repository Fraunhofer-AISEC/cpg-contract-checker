pragma solidity ^0.8;

contract Promotion {
    string description;
    uint max_influencer;
    uint jobvalue;
    bool achievement;
    
    
    
    
    constructor(string memory _description, uint _budget, uint _max_influencer) payable {
        description = _description;
        max_influencer = _max_influencer;
    }
    
    
    receive() external payable {
    }
}


contract Campaign {
    address[] public deployedPromotions;
    
    uint budget;
    
    
    function createPromotion(string memory description, uint max_influencer) public payable{
        budget = msg.value; 
        address newPromotion = address(new Promotion(description, budget, max_influencer));
        deployedPromotions.push(newPromotion);
        payable(newPromotion).transfer(budget); 
    }
}
