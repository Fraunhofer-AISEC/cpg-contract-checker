pragma solidity >=0.6.2 <0.7.0;


contract Slot_Machine is Mortal{

  event MyGuess(address indexed from, uint myguess);
  event Message(address indexed from, string  message, uint guess, uint random_number, uint  deposit, uint  winnings);

  
  
  
  struct Player{
      address payable wallet;
      uint deposit;
      uint guess;
  }

  bool reEntrancyMutex = false;
  bool isWinner;
  mapping (address => Player) public player;

  
  uint randomNumber;

  constructor() public{}

  
  function generateRandomNumber() internal returns(uint) {
    uint balancer = uint(keccak256(abi.encodePacked(block.number,block.difficulty,msg.sender))) % 100;
    randomNumber = uint(keccak256(abi.encodePacked(block.number,block.number-balancer,msg.sender))) % 100;
    return randomNumber;
  }

  
  function getRandomNumber() public view returns(uint){
    return randomNumber;
  }

  
  function newPlayer(uint pdeposit, uint pguess) private{
    player[msg.sender] = Player(msg.sender, pdeposit, pguess);
  }

  
  function playResult() public{
    isWinner = player[msg.sender].guess == randomNumber;
  }

  
  function transferWinnings() private{
    player[msg.sender].wallet.transfer(player[msg.sender].deposit*2 wei);
  }


  
  function getBalance() public view returns(uint) {
    return address(this).balance;
  }

  fallback () external payable{}

  receive () external payable{
    require(msg.sender.balance >= msg.value,
          "Insufficient balance to complete transaction.");
  }

  function main(uint pguess) public payable{
    require(!reEntrancyMutex);
    
    newPlayer(msg.value,pguess);
    
    generateRandomNumber();
    
    playResult();
    reEntrancyMutex = true;
    
    if(!isWinner){
      emit Message(player[msg.sender].wallet,"Loss",pguess,getRandomNumber(),msg.value, 0);

    } else {
          transferWinnings();
          emit Message(player[msg.sender].wallet,"Win",pguess,getRandomNumber(),msg.value, msg.value*2);
    }

    reEntrancyMutex = false;

  }
}
