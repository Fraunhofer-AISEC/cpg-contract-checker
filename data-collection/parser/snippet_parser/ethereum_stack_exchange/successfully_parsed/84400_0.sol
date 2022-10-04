contract Slot_Machine is Mortal{

  
  
  
  struct Player{
      address payable wallet;
      uint deposit;
      uint guess;
  }

  mapping (address => Player) public player;

  constructor() public{
      newPlayer(10,5);
  }

  function sendPay(address to, uint amount) public {
      player[to].wallet.transfer(amount);

  }
}