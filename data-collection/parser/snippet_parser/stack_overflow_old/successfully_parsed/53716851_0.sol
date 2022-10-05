pragma solidity ^0.4.24;

contract Lottery{

  uint public winn;

  
  struct lottery{

    uint money;   
    address name;    
    
  }


  
  address private bankerAddress = 0x8b3234612c7D3b805F4c9CF1Aa55Cc47B82A0769;

  
  uint32 public count;

  
  lottery public l;



  
  constructor()public {
    count=0;
  }


  event getRandom (
    uint indexed _win);



  
  function start() public payable{
    
    
    
    uint win= uint(keccak256(now, msg.sender, now)) % 100;
    
    win = win % 12 +1;
    winn = win;
    
    
    l.money = winn;
    l.name = msg.sender;
    
    
    msg.sender.transfer(winn*10000000000000000);


    
    getRandom(winn);
  }

  function () public payable{}
}
