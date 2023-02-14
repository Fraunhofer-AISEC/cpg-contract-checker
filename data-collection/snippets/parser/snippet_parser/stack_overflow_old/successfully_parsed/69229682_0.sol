contract Campaign {
    
     struct Promotion {
        string description;
        uint max_influencer;
        uint jobvalue;
        bool achievement;
        }
    
  address[] public deployedPromotions;
  uint budget = msg.value;

  function createPromotion(string description, uint max_influencer) public payable{
      address newPromotion = new Promotion(description, budget, max_influencer);
      deployedPromotions.push(newPromotion);
      newPromotion.transfer(budget);
  }
}