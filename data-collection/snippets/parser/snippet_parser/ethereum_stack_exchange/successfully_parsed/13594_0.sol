pragma solidity ^0.4.6;





contract NaiveSplit {

  address[4] public beneficiaryList;

  

  event LogReceived(address sender, uint amount);
  event LogSent(address beneficiary, uint amount);

  

  function FourWaySplit(address addressA, address addressB, address addressC, address addressD) {
    beneficiaryList[0]=addressA;
    beneficiaryList[1]=addressB;
    beneficiaryList[2]=addressC;
    beneficiaryList[3]=addressD;
  }

  function pay() 
    public
    payable
    returns(bool success)
  {
    if(msg.value==0) throw;

    uint forth = msg.value / 4;

    beneficiaryList[0].send(forth);
    beneficiaryList[1].send(forth);
    beneficiaryList[2].send(forth);
    beneficiaryList[3].send(forth);
    LogReceived(msg.sender, msg.value);
    LogSent(beneficiaryList[0], forth);
    LogSent(beneficiaryList[1], forth);
    LogSent(beneficiaryList[2], forth);
    LogSent(beneficiaryList[3], forth);
    return true;
  }
}
