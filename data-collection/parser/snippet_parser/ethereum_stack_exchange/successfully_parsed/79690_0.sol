pragma solidity^0.5.12;
contract customer{
  address payable[]  public onboarded;
  bytes public fullname;
  bytes public id;
  bool public KYC;
  uint256 public categor;
  function prime(bytes memory fname, bytes memory iden, bool KYCresult, uint256 level, address payable bank) public{
    fullname=fname;
    id=iden;
    KYC=KYCresult;
    categor=level;
    onboarded.push(bank);
  }
  function() external payable{}
  }
function Array() public returns(uint256){
return onboarded.length;
}
