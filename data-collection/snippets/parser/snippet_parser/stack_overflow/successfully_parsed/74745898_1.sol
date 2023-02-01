address public owner;
address public balance;

constructor() {
    owner == msg.sender;
}

address public constant routerAddress =
    0xE592427A0AEce92De3Edee1F18E0157C05861564;
ISwapRouter public immutable swapRouter = ISwapRouter(routerAddress);

address public constant SHUBYDAI = 0xe742A911ffFAEc86786bd2246Dd035F6Aa55aE2B;
address public constant SHUBYUSDC = 0xA61C9829209b75741bBB9f682483B3A4C3e4E924;

IERC20 public shubyToken = IERC20(SHUBYDAI);

function swapExactInputMultihop(uint amountIn) 
    external
    returns (uint amountOut)
{
    shubyToken.transfer(
        address(this),
        amountIn
    );
    shubyToken.approve(address(swapRouter), amountIn);

    ISwapRouter.ExactInputParams memory params = ISwapRouter
    .ExactInputParams({
        path: abi.encodePacked(
            SHUBYDAI,
            uint24(3000),
            SHUBYUSDC,
            uint24(3000),
            SHUBYDAI
        ),
        recipient: msg.sender,
        deadline: block.timestamp,
        amountIn: amountIn,
        amountOutMinimum: 0
    });
    amountOut = swapRouter.exactInput(params);
}

function transferIERC20(IERC20 token, address to, uint256 amount) public {
    require(msg.sender == owner, "Only the owner can use this function");
    uint256 erc20Balance = token.balanceOf(address(this));
    require(amount <= erc20Balance, "balance is low");
    token.transfer(to, amount);
}

function SeeBalance(IERC20 token) public view {
   IERC20(token).balanceOf(address(this));
   
}
