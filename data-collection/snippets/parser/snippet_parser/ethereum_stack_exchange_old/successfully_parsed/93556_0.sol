import "./interfaces/IUniswapV2Pair.sol";
import "./interfaces/IUniswapV2Factory.sol";

contract Uniswap {

   IUniswapV2Factory factory;

   constructor(address _factory) {
       factory = IUniswapV2Factory(_factory);
   }

   function getLiquidity(address tokenA, address tokenB) view external returns (uint256) {
       IUniswapV2Pair pair;
       pair = IUniswapV2Pair(factory.getPair(tokenA, tokenB));
       return pair.balanceOf(msg.sender);
   }
   
}
