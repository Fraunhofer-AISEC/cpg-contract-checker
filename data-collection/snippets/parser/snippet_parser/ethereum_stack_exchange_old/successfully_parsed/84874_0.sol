   contract Slot_Machine is Mortal{

  
  
  

  struct Player{
      address payable wallet;
      uint deposit;
      uint guess;
  }

  address payable slotMachine;

  mapping (address => Player) public player;

  
  uint randomNumber;

  constructor() public{
    randomNumber = 5;
  }

  fallback () external payable{}

  receive () external payable{
    require(msg.sender.balance >= msg.value,
          "Insufficient balance to complete transaction.");
  }

  function main(uint pdeposit, uint pguess) public{

    player[msg.sender] = Player(msg.sender, pdeposit, pguess);

    if(player[msg.sender].guess != randomNumber){
      emit Message("Unlucky this time! try again when you are feeling lucky!");

    } else {
          player[msg.sender].wallet.transfer(player[msg.sender].deposit*2 ether);
          emit Message("You Win!");
    }

  }
}
