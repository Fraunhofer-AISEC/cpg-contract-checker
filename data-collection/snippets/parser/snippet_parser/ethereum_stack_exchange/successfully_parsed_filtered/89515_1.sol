pragma solidity ^0.5.0;

contract Oracle{
   
   address payable public provider;
   address payable public buyer;
   
   string public data;
   bool public needsUpdate;
   uint lastUpdate;
   enum Status { Available, Active, Paused, Ended }
   Status status;

   string public dataType;
   string public dataFormat;

   uint public updateCost;  
   uint public balance;     
   uint public updateCycle; 
   
   constructor(
      address payable owner,
      string memory dtype,
      string memory dformat,
      uint cost,
      uint cycle
   )public{
      provider = owner;
      dataType = dtype;
      dataFormat = dformat;
      updateCost = cost;
      updateCycle = cycle;
      needsUpdate = false;
      status = Status.Available;
      data = "";
      balance = 0;
   }
   function takeContract() public returns(bool success){
      if(status == Status.Available){
         buyer = msg.sender;
         status = Status.Active;
         return true;
      }
      return false;
   }
   function update(string memory newData) public returns(bool success){
      if((msg.sender != provider)||(!needsUpdate))
         return false;
      if(now >= lastUpdate + updateCycle)
         provider.transfer(updateCost);
      data = newData;
      needsUpdate = false;
      lastUpdate = now;
      return true;
   }
   function request() public returns(bool success){
      if((msg.sender != buyer)||(balance < balance - updateCost))
         return false;
      needsUpdate = true;
      return true;
   }
   function endSell() public returns(bool success){
      if((msg.sender != provider)||(needsUpdate))
         return false;
      if(!(buyer.send(balance))){
         return false;
      }
      return true;
   }
   function endBuy() public returns(bool success){
      if(msg.sender != buyer)
         return false;
      if(!(buyer.send(balance))){
         return false;
      }
      status = Status.Ended;
      return true;
   }

   
   function setType(string memory dtype) public returns(bool success){
      if((msg.sender != provider)||(balance > 0))
         return false;
      dataType = dtype;
      return true;
   }
   function setFormat(string memory format) public returns(bool success){
      if((msg.sender != provider)||(balance > 0))
         return false;
      dataFormat = format;
      return true;
   }
   function setCycle(uint cycle) public returns(bool success){
      if((msg.sender != provider)||(balance > 0))
         return false;
      updateCycle = cycle;
      return true;
   }
   function setCost(uint cost) public returns(bool success){
      if((msg.sender != provider)&&(balance > 0))
         return false;
      updateCost = cost;
      return true;
   }
   function() external payable{
      balance += msg.value;
   }
}