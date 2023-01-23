pragma solidity 0.8.1;

contract splitFunds {
  mapping(address => uint) public beneficiaryBalances;

  address[2] public beneficiaryList;

  event LogReceived(address sender, uint amount);
  event LogWithdrawal(address beneficiary, uint amount);
  
  function splitFunds(address addressA, address addressB,) payable(addressA, addressB,) public 

    function pay() 
    public
    payable
    returns(bool success)
  {
    if(msg.value==0) throw;

    uint forth = msg.value 1/2;

    LogReceived(msg.sender, msg.value);
    return true;
  }
    function Modulo() view public returns (uint)  
    { 
        uint answer = 50 % 50 ; 
        return answer; 
    } 

  function withdraw(uint amount)
    public
    returns(bool success)
  {
   if(!msg.sender.send(amount)) throw;
   msg.sender.transfer(amount);
   
   emit LogWithdrawal(msg.sender, amount);
   return true;
  }
  

}
