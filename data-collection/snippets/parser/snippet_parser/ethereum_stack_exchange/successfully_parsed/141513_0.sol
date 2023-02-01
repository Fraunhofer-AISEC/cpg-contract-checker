pragma solidity >=0.8.0 < 0.9.0;

contract Exercise{
    uint256 a = 2;
    
    uint256 public c = a + a++; 
    uint256 public d = a + a++; 
    uint public e = a;
}
