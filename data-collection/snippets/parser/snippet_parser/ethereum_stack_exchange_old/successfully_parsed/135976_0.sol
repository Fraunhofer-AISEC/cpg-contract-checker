

pragma solidity 0.8.16;

contract test7 {
  function getNum() public pure returns(uint256[4] memory,string memory) {
      string[4] memory _a = ['1','2','3','4'];

      uint256[4] memory a = [1,2,3,4]; 

      return (a,_a);
  }
}
