

pragma solidity ^0.8.7;

contract Uniswap {
    address private constant UNISWAP_V2_ROUTER = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    address private constant WETH = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;

    function swap(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn
    ) external {
        IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
        IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER, _amountIn);

        address[] memory path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        address recipient = address(this);

        IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
            _amountIn,
            0,
            path,
            recipient,
            block.timestamp
        );
    }
}

interface IUniswapV2Router {
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);
}

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);


}

