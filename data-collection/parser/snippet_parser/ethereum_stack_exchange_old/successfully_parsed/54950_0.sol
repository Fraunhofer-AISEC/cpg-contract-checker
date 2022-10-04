contract Coordinator {
  uint256 public endOfCommitRequest;

  uint256 public commitCounter;
  uint256 public abortCounter;

  constructor(
    uint256 _endOfCommitRequest
  ) public {
   endOfCommitRequest = _endOfCommitRequest;
  }

  function commitRequest(bool agreement) public onlyBeforeEndOfCommitRequest {
    if(agreement) {
        commitCounter++;
    } else {
        abortCounter++;
    }  
  }

  function commit() public onlyAfterCommitPhase {
    if(abortCounter == 0) {
        
    }  else {
        
    }
  }

  modifier onlyBeforeEndOfCommitRequest() {
    require(now < endOfCommitRequest);  
    _;  
  }

  modifier onlyAfterCommitPhase() {
    require(now > endOfCommitRequest);  
    _;  
  }
}
