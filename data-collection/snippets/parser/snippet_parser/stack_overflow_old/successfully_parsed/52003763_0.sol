pragma solidity ^0.4.17;
contract WithdrawalContract {
   mapping(address => uint) buyers;

   function buy()public payable {
      require(msg.value > 0);
      buyers[msg.sender] = msg.value;
   }
   function withdraw()public {
      uint amount = buyers[msg.sender];
      require(amount > 0);
      buyers[msg.sender] = 0;      
      require(msg.sender.send(amount));
   }
}
