function rateSeller(address seller, address rater, uint rating) public {
    reputation[seller][rater] = rating;
        
          uint reputationSum = 0;
          uint numRatings = 0;
          uint reputationAverage=0;
          for (address rater in reputation[seller]){
                  reputationSum += reputation[seller][rater];
                  numRatings++;
          
          }
           reputationAverage=reputationSum / numRatings;
          
           return reputationAverage;
         
          }`
