

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";


contract SampleERC20 is ERC20 {

    constructor(string memory tokenName, string memory tokenSymbol) ERC20(tokenName, tokenSymbol) {}

    function token0ToToken1(address pairAddress, uint amount) public view returns(uint) {
        IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
        ERC20 token0 = ERC20(pair.token0());
        (uint Res0, uint Res1,) = pair.getReserves();
        uint k = (Res0/Res1)*(10**token0.decimals());
        return(amount/k);
    }
}
