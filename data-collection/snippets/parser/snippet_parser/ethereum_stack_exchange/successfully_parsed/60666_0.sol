contract getSchwifty {
  string internal constant seeWhatYouGot = "I want to see what you got!";
  string internal contestResult;
  mapping(uint=>string) Record;

  
  function getSchwifty(string _contestResult) public {
    contestResult = _contestResult;
  }

  function addRecord(uint id, string hashData) public {
    Record[id] = hashData;
  }

  function getRecord(uint id) public returns (string) {
    return Record[id];
  }

  function showMeWhatYouGot() external pure returns (string) {
    return seeWhatYouGot;
  }

  function enterContest(string _contestEntry) external view returns (string) {
    
    return contestResult;
  }
}
