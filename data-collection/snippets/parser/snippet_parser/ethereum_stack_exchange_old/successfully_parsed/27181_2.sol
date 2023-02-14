pragma solidity ^0.4.13;

contract test {

    uint public fee; 
    function setFee(uint _fee){
      fee = Sf.mul(_fee,10);
    }

}


library Sf{

  function mul(uint256 a, uint256 b) internal constant returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }


}
