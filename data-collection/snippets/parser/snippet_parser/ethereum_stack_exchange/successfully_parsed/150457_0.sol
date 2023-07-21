
interface IPancakeFactory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

interface IPancakePair {
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

interface IPancakeRouter01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);
}

interface IPancakeRouter02 is IPancakeRouter01 {}

contract MyTokenContract is Context, Ownable, IERC20 {

  IPancakeRouter02 internal _router;
  IPancakePair internal _pair;

  constructor(address _routerAddress) {
          _router = IPancakeRouter02(_routerAddress);
          _pair = IPancakePair(IPancakeFactory(_router.factory()).createPair(address(this), _router.WETH()));
        
          _balances[owner()] = _totalSupply;
          emit Transfer(address(0), owner(), _totalSupply);
    }
}
