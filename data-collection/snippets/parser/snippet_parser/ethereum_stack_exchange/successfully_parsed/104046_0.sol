
    pragma solidity >=0.4.24;
    
    import "./Owned.sol";
    
    contract ReReviews is Owned {
    
      
      struct Review {
        uint id;
        address reviewer;
        address visitor;
        string name;
        string comments;
        uint totalUpvotes;
        uint totalRewards;
        uint totalDownvotes;
        string ipfsHash;
      }
    
      
      mapping(uint => Review) public reviews;
      uint reviewCounter;
    
      
      event addReviewEvent(
        uint indexed _id,
        address indexed _reviewer,
        string _name,
        string _ipfsHash
        );
    
      
      event viewReviewEvent(
        uint indexed _id,
        address indexed _reviewer,
        address indexed _visitor,
        string _name,
        uint _totalUpvotes,
        uint _totalRewards,
        uint _totalDownvotes,
        string _ipfsHash);
    
    
      
      function addReview(string memory _name, string memory _comments, string memory _ipfsHash) public {
        
        reviewCounter++;
    
        
        reviews[reviewCounter] = Review(
            reviewCounter,
            msg.sender,
            0X0,
            _name,
            _comments,
            0,
            0.000,
            0,
            _ipfsHash
          );
    
        
        addReviewEvent(reviewCounter, msg.sender, _name, _ipfsHash);
      }
    
      
      function getNumberOfReviews() public  returns (uint) {
        return reviewCounter;
      }
    
      
      function getReviewsToView() public  returns (uint[] memory) {
        
        if(reviewCounter == 0) {
          return new uint[](0);
        }
    
        
        uint[] memory reviewIds = new uint[](reviewCounter);
    
        uint numberOfReviewsForVisit = 0;
        
        for (uint i = 1; i <= reviewCounter; i++) {
          
          
            reviewIds[numberOfReviewsForVisit] = reviews[i].id;
            numberOfReviewsForVisit++;
          
        }
    
        
        uint[] memory forReview = new uint[](numberOfReviewsForVisit);
        for (uint j = 0; j < numberOfReviewsForVisit; j++) {
          forReview[j] = reviewIds[j];
        }
        return (forReview);
      }
    
      
      function viewReview(uint _id,uint _totalUp, uint _totalDown) payable public {
        
        require(reviewCounter > 0);
        
        require(_id > 0 && _id <= reviewCounter);
    
        
        Review storage review = reviews[_id];
        if(_totalUp == 1 ){
          review.totalUpvotes = review.totalUpvotes + 1;
          review.totalRewards = review.totalRewards + msg.value;
        }
        if(_totalDown == 1 ){
          review.totalDownvotes = review.totalDownvotes + 1;
          review.totalRewards = review.totalRewards - msg.value;
        }
        
        
        
    
        
        require(review.reviewer != msg.sender);
    
        
        review.visitor = msg.sender;
    
        
        review.reviewer.transfer(msg.value);
    
        
        viewReviewEvent(_id, review.reviewer, review.visitor, review.name, review.totalUpvotes, review.totalRewards, review.totalDownvotes, review.ipfsHash);
      }
    
      
      function kill() onlyOwner public {
        selfdestruct(owner);
      }
    }
