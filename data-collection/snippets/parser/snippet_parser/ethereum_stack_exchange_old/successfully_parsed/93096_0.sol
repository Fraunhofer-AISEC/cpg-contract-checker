pragma solidity >=0.5.0.0 <0.9.0;

contract SimpleTranaction {
    address  payable public receiver =  0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    function sendTo(uint amount)   public  payable  {
      
        require(msg.sender.balance < amount, "Insufficient balance");
        receiver.transfer(amount); 
    }
}
