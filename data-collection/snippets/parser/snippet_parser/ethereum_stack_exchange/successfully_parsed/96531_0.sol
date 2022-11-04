pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";


contract ChainlinkTimedVote is ChainlinkClient
{
  uint private oraclePayment;
  address private oracle;
  bytes32 private jobId;
  uint private yesCount;
  uint private noCount;
  bool private votingLive;
  mapping(address => bool) public voters;

  
  address payable owner;
  modifier onlyOwner {
  require(msg.sender == owner);
  _;
  }

  constructor() public {
      setPublicChainlinkToken();
      owner = msg.sender;
      oraclePayment = 0.1 * 10 ** 18; 
      
      oracle = 0x7AFe1118Ea78C1eae84ca8feE5C65Bc76CcF879e; 
      jobId = "4fff47c3982b4babba6a7dd694c9b204";
      
      yesCount = 0;
      noCount = 0;
      votingLive = false;
  }

  function startVote(uint voteMinutes) public onlyOwner {
      Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
      req.addUint("until", now + voteMinutes * 1 minutes);
      
      votingLive = true;
      sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  
  function fulfill(bytes32 _requestId) public recordChainlinkFulfillment(_requestId) {
      
      votingLive = false;
  }

  
  function vote(bool voteCast) public {
    require(!voters[msg.sender], "already Voted!");
    
      if(voteCast) {yesCount++;}
      if(!voteCast) {noCount++;}
      
      voters[msg.sender] = true;
   }
   
   
  function getVotes() public view returns (uint yesVotes, uint noVotes) {
      return(yesCount, noCount);
  }
  
  function isVotingLive() public view returns (bool) {
      return votingLive;
  }

  
  function haveYouVoted() public view returns (bool) {
      return voters[msg.sender];
  }
}
