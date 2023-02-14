contract Betting is Ownable {
   
   uint256 public minimumBet;
   
   event EtherTransfer(address beneficiary, uint amount);
   
   uint256[] public totalBetHome = new uint256[](100);
   uint256[] public totalBetAway = new uint256[](100);
   uint256[] public totalBetDraw = new uint256[](100);
   uint256 public numberOfBets;
   uint256 public maxAmountOfBets = 1000;
    
   uint256 devFee = 9500;
   
   address[] public players;

   address public owner;
   
   struct Player {
      uint256 amountBet;
      uint16 matchSelected;
      uint16 resultSelected;
   }
   
   mapping(uint16 => uint16[]) matchInfo;
   
   mapping(address => bytes32[]) userAdd;
   
   mapping(uint16 => uint16[]) selectedResult;
   
   mapping(uint256 => uint256[]) betAmount;
   
   mapping(uint16 => bool) matchBettingActive;

   mapping(address => Player) public playerInfo;

   function() public payable {}

   constructor() public {
       owner = msg.sender;
      
      minimumBet = 100000000000000;


   }
   function kill() public {
      if(msg.sender == owner) selfdestruct(owner);
    }

   function checkIfPlayerExists(address player) public view returns(bool){
      for(uint256 i = 0; i < players.length; i++){
         if(players[i] == player) return true;
      }
      return false;
   }
   
   function checkIfMatchStatus(uint16 _match) public view returns(bool){
   if(matchBettingActive[_match] == true){
       return true;
   }
   else{
       return false;
       }
   }
   
   function _checkBetMatchIsValid(address _user, uint16 _matchId, uint16 _chosenWinner) private view returns (bool) {

        
       uint16[] storage addUser = userAdd[_user]; 
        if (addUser.length > 0) {
            for (uint n = 0; n < addUser.length; n++) {
                if (addUser[n] == _matchId) {
                    
                    return false;
                }
            }
        }

        uint8 participantCount; 
        if (_chosenWinner >= participantCount)
            return false;

        return true;
    }

   function initializeMatches(uint8 _numberMatches) public onlyOwner{
      for(uint256 i = 0; i < _numberMatches; i++){
         totalBetHome[i] = 0;
         totalBetAway[i] = 0;
         totalBetDraw[i] = 0;
      }
   }
   
   function beginVotingPeriodForMatch(uint16 _match)  public onlyOwner returns(bool) {
    matchBettingActive[_match] = true;
    return true;
  }
  
   function closeVotingForMatch(uint16 _match) public onlyOwner returns (bool) {
    
    matchBettingActive[_match] = false;
    return true;
  }

   function bet(uint16  _matchSelected, uint16  _resultSelected) public payable {
       require(matchBettingActive[_matchSelected] == true, "Betting: match voting is disabled");
      
    
    
      
      require(msg.value >= minimumBet);
      
      require(!_checkBetMatchIsValid(msg.sender,_matchSelected, _resultSelected));
      
      matchInfo[] storage idMatch = _matchSelected;
      idMatch.push(msg.sender, _matchSelected, _resultSelected);
      
      bytes32[] storage userBets = userAdd[msg.sender];
      userBets.push(_matchSelected);
       
      
      
     
    
    
      
      
      
      
      players.push(msg.sender);
    
      
      if ( _resultSelected == 1){
          totalBetHome[_matchSelected] += msg.value;
      }
      else if( _resultSelected == 2){
          totalBetAway[_matchSelected] += msg.value;
      }
      else{
          totalBetDraw[_matchSelected] += msg.value;
      }
   }

   function distributePrizes(uint16 matchFinished, uint16 teamWinner) public onlyOwner {
      address[1000] memory winners;
      
      uint256 count = 0; 
      uint256 loserBet = 0; 
      uint256 winnerBet = 0; 
      address add;
      uint256 bets;
      address playerAddress;
    
      
      for(uint256 i = 0; i < players.length; i++){
         playerAddress = players[i];
         
         if(playerInfo[playerAddress].matchSelected == matchFinished &&
            playerInfo[playerAddress].resultSelected == teamWinner){
            winners[count] = playerAddress;
            count++;
         }
       }
       
       if ( teamWinner == 1){
         loserBet = totalBetAway[matchFinished] + totalBetDraw[matchFinished];
         winnerBet = totalBetHome[matchFinished];
       }
       else if ( teamWinner == 2){
         loserBet = totalBetHome[matchFinished] + totalBetDraw[matchFinished];
         winnerBet = totalBetAway[matchFinished];
       }
       else{
          loserBet = totalBetHome[matchFinished] + totalBetAway[matchFinished];
          winnerBet = totalBetDraw[matchFinished];
       }
      
      for(uint256 j = 0; j < count; j++){
          
         if(winners[j] != address(0))
            add = winners[j];
            bets = playerInfo[add].amountBet;
            uint256 amountToPlayer = (bets * (10000+(loserBet*devFee/winnerBet))) / 10000;
            winners[j].transfer(amountToPlayer);
      }
      
      delete playerInfo[playerAddress]; 
      players.length = 0; 
      loserBet = 0; 
      winnerBet = 0;
      
      for(uint256 k = 0; k < 10; k++){
         totalBetHome[k] = 0;
         totalBetAway[k] = 0;
         totalBetDraw[k] = 0;
      }
    }
}