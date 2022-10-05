interface ERC20 {
  function balanceOf(address owner) external view returns (unit);
  function allowance(address owner, address spender) external view returns (unit);
  function approve(address spender, uint value) external returns (bool);
  function transfer(address to, uint value) external returns (bool);
  function transferFrom(address from, address to, uint value) external returns (bool); 
}
