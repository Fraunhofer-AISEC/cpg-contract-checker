const factoryContract = new ethers.Contract(
  "AddFactoryHere", 
  [
  'event PairCreated(address indexed token0, address indexed token1,address pair, uint)',
  'function getPair(address tokenA, address tokenB) external view returns (address pair)',
  'function balanceOf(address owner) external view returns (uint)',
  'function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast)'
  ],
  signer 
);
