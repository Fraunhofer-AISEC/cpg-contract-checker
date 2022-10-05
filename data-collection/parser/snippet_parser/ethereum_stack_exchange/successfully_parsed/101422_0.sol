
 
pragma solidity ^0.7.0;

 
interface IUniswap {
   function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline)
        external
        returns (uint[] memory amounts);
        function WETH() external pure returns(address);
 
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
}
 
interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
}
 
contract Swap {
    IUniswap uniswap;
    address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private DAI = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;
    address private USDC = 0xb7a4F3E9097C08dA09517b5aB877F7a917224ede;
    address private WETH = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;
 
    constructor() {
        uniswap = IUniswap(UNISWAP_ROUTER_ADDRESS);
    }
 
    function swapFeeTokensforTokens(
        address token,
        uint amountIn,
        uint amountOutMin)
        external {
            IERC20(token).transferFrom(msg.sender, address(this), amountIn);
            address[] memory path = new address[](3);
            path[0] = USDC;
            path[1] = uniswap.WETH();
            path[3] = DAI;
            IERC20(token).approve(address(uniswap), amountIn);
            uniswap.swapExactTokensForTokensSupportingFeeOnTransferTokens(
                amountIn,
                amountOutMin,
                path,
                msg.sender,
                block.timestamp
            );
 
        }
 
    
     receive() payable external {}
}
