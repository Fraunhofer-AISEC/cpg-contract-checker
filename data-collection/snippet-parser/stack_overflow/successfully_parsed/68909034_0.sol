

pragma solidity ^0.4.2;


contract Ownable {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    constructor() public {
        owner = msg.sender;
    }

    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

}

contract Betting is Ownable {
   
   uint256 public minimumBet;
   
   event EtherTransfer(address beneficiary, uint amount);
   
   uint256[] public totalBetHome = new uint256[](10);
   uint256[] public totalBetAway = new uint256[](10);
   uint256[] public totalBetDraw = new uint256[](10);
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

   function bet(uint16 _matchSelected, uint16 _resultSelected) public payable {
       require(matchBettingActive[_matchSelected], "Betting: match voting is disabled");
      
    
    
      
      require(msg.value >= minimumBet);
      
      
      playerInfo[msg.sender].amountBet = msg.value;
      playerInfo[msg.sender].matchSelected = _matchSelected;
      playerInfo[msg.sender].resultSelected = _resultSelected;
      
      
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
    
    function withdrawEther(address beneficiary) public onlyOwner {
        beneficiary.transfer(address(this).balance);
    }
    
     function setDevFee(uint256 newDevFee) public onlyOwner() {
        devFee = newDevFee;
    }
    
     function setMinBet(uint256 newMinBet) public onlyOwner() {
        minimumBet = newMinBet;
    }

    function AmountHome(uint16 _matchSelected) public view returns(uint256){
       return totalBetHome[_matchSelected];
    }
    function AmountAway(uint16 _matchSelected) public view returns(uint256){
       return totalBetAway[_matchSelected];
    }
    function AmountDraw(uint16 _matchSelected) public view returns(uint256){
       return totalBetDraw[_matchSelected];
    }
} 
