pragma solidity ^0.4.11;
contract MetaCoin {

  event FlipCoinEvent(
    uint value,
    address owner
  );

    event PlaySlotEvent(
      uint value,
      address owner
    );

  function() public payable {}

  function flipCoin() public payable {
    assert(msg.value < 100000000000000000);
    uint value = (block.timestamp + uint(block.blockhash(block.number-1)))%100 + 1;
    if (value > 55){
      msg.sender.transfer(msg.value * 2);
    }
    FlipCoinEvent(value, msg.sender);
  }

function playSlot() public payable {
    require(msg.value < 100000000000000000);
    uint r = (block.timestamp + uint(block.blockhash(block.number-1)))%100 + 1;
       if(r >0 && r<3){
             PlaySlotEvent(3,msg.sender);
             msg.sender.transfer(msg.value * 12);
       }else if(r >3 && r<6){
             PlaySlotEvent(2,msg.sender);
             msg.sender.transfer(msg.value * 6);
       }else if(r >6 && r<9){
             PlaySlotEvent(1,msg.sender);
             msg.sender.transfer(msg.value * 3);
       }else{
            PlaySlotEvent(0,msg.sender);
       }

  }

  function getBalance() public constant returns(uint bal) {
    bal = this.balance;
    return bal;
  }

}
