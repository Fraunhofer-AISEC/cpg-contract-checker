
pragma solidity ^0.8.4;

interface IPancakeswap {
    function swapExactTokensForETH(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function WETH() external pure returns (address);
}

interface IERC20 {
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function approve(address sender, uint256 amount) external returns (bool);
}

contract SwapProject {
    IPancakeswap pancake;

    constructor() {
        pancake = IPancakeswap(0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3);
    }

    function WETH() external view returns(address){
        address wbnb = pancake.WETH();
        return wbnb;
    }

    function swapExactTokensForETH(
        address token,
        uint amountIn,
        uint amountOutMin,
        uint deadline
    ) external {
        IERC20(token).transferFrom(msg.sender, address(this), amountIn);
        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = pancake.WETH();

        uint deadlinePro = (deadline * 1 minutes) + block.timestamp;

        IERC20(token).approve(address(pancake), amountIn);
        pancake.swapExactTokensForETH(
            amountIn,
            amountOutMin,
            path,
            msg.sender,
            deadlinePro
        );
    }
}

