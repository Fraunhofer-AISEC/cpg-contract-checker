pragma solidity ^0.4.6;

contract Royalty {

  address public B;
  address public C;
  uint public owedToB;
  uint public owedToC;

  event LogPaymentReceived(address sender, uint amount);
  event LogPaid(address recipient, uint amount);

  

  function Royalty(address addressB, address addressC) {
    B = addressB;
    C = addressC;
  }

  function pay()
    public
    payable
    returns(bool success)
  {
    owedToB += msg.value;

    
    
    

    if(msg.value > 50) {
      owedToC += 10;
      owedToB -= 10;
    }

    LogPaymentReceived(msg.sender, msg.value);
    return true;
  }

  function withdraw() 
    public
    returns(uint amountSent)
  {
    if(msg.sender != B && msg.sender != C) throw; 

    uint amount;
    if(msg.sender == B) {
        amount = owedToB;
        owedToB = 0;
        if(!B.send(amount)) throw;
        LogPaid(B,amount);
        return amount;
    }
    if(msg.sender == C) {
        amount = owedToC;
        owedToC = 0;
        if(!C.send(amount)) throw;
        LogPaid(C,amount);
        return amount;
    }
    
    throw;
  }

}
