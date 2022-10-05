  AggregatorInterface internal ref;
  
  
  address _aggregator = 0x8468b2bDCE073A157E560AA4D9CcF6dB1DB98507;
  string toni;
  constructor() public {
    
    ref = AggregatorInterface(_aggregator);
    
  }
    int256 price;

  function getLatestAnswer() public view returns (int256) {
    return ref.latestAnswer();
  }    
