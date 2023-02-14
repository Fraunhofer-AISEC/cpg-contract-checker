contract FantasyLeague {
  
  address public commissioner;
  
  uint[] public proposals;
  address[] public members;
  address[] public rightsGiven;


  constructor() public payable {
    commissioner = msg.sender;
  }

  function giveRightToVote(address newVoter) public payable {
    require(msg.sender == commissioner);
    
    rightsGiven.push(newVoter); 
  }
}
