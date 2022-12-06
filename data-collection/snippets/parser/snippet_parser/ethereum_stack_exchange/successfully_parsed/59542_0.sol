pragma solidity ^0.4.19;

contract getSchwifty {
  string internal constant seeWhatYouGot = "I want to see what you got!";
  string internal contestResult;

  
  function getSchwifty(string _contestResult) public {
    contestResult = _contestResult;
  }

  function showMeWhatYouGot() external pure returns (string) {
    return seeWhatYouGot;  
  }

  function enterContest(string _contestEntry) external view returns (string) {
    
    return contestResult;
  }
} 
