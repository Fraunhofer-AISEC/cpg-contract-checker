pragma solidity 0.8.4;

contract AddOverflow {

    uint256 public  a = 1;     
    uint256 public  b = 2;     
    uint256 public  c; 
   
    function add() public returns (uint256) {
        c = unchecked {a + b};
        return c;
    }
  
}
