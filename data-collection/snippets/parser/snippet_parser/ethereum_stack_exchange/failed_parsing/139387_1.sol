

pragma solidity >=0.7.0 <0.9.0;

 interface Staker { 
   function openForWithdraw() external view returns(bool);
 }


 contract test {
    address contractAddress = 0xb9......; 
    Staker staker = Staker(contractAddress);


    function test1() public returns(bool){
      bool result = staker.openForWithdraw();
      return result;
    }
 }
