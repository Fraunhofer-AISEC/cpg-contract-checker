

pragma solidity <0.9.0;

interface UniswapInterface{
   function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}

interface IERC20{
    function balanceOf(address account) external view returns (uint256);
    function decimals() external view returns (uint8);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}


contract swapContract{
    address public UniSwapRouterAddress = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public USDCAddress = 0x2fB298BDbeF468638AD6653FF8376575ea41e768;
    address public BTCAddress = 0x577D296678535e4903D59A4C929B718e1D575e0A;

    IERC20 USDC = IERC20(0x2fB298BDbeF468638AD6653FF8376575ea41e768);
    IERC20 BTC = IERC20(0x577D296678535e4903D59A4C929B718e1D575e0A);

    UniswapInterface UniSwapRouter = UniswapInterface(UniSwapRouterAddress);

    function approveUSDC() public{
        USDC.approve(UniSwapRouterAddress, 999**9);
    }
    function approveBTC() public{
        BTC.approve(UniSwapRouterAddress, 999**9);
    }

    function deposit(uint256 amount) public{
        require(amount > 0, "0 is not accepted!");
        uint256 allowance = USDC.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check USDC allowance");
        USDC.transferFrom(msg.sender, address(this), amount);
    }
    
    function withdraw() public {
        USDC.transfer(msg.sender, USDC.balanceOf(address(this)));
    }

    function swapUSDC() public {
        address[] memory Path = new address[](2);
        Path[0] = USDCAddress;
        Path[1] = BTCAddress;
        UniSwapRouter.swapExactTokensForTokens(
            100000000,
            0,
            Path,
            address(this),
            block.timestamp + 240
        );
    }
}
