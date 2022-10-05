pragma solidity ^0.8;

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);
}

contract MyContract is IERC20 {
    function totalSupply() external view returns (uint256) {
        
    }
    
    function balanceOf(address who) external view returns (uint256) {
        
    }
    
    
}
