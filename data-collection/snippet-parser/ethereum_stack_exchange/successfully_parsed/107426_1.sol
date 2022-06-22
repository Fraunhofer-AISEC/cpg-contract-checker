interface RINKEBYTOKEN{
  function deposit() external payable;
  function transfer(address dst, uint wad) external returns (bool);
  function withdraw(uint wad) external;
  function allowance(address _owner, address _spender)external view returns (uint256);
  function approve(address _spender, uint256 _value) external returns (bool);
  function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
  event Approval(address indexed owner, address indexed spender,uint256 value);
}
