    contract SimpleAuction {
  AggregatorInterface internal ref;
  
  
  address _aggregator = 0x8468b2bDCE073A157E560AA4D9CcF6dB1DB98507;
  string toni;
  constructor() public {
    
    ref = AggregatorInterface(_aggregator);
    
  }
    

  function getLatestAnswer() public view returns (int256) {
    return ref.latestAnswer();
  }    


    int256 private Limit;
    
    
    
    int256 yes = 1;
    int256 no = 2;

    
    function getEth(int256 price) public view returns (uint256){
       
    }
    
    function setLimit(int256 newLimit) public {
        Limit = newLimit;
        sellLogic();
     }    
    
    function sellLogic() private {
       
        
        int256 price = ref.latestAnswer();
        if (price > Limit){
            sell = true;
        }else {
            sell = false;
        }
        
