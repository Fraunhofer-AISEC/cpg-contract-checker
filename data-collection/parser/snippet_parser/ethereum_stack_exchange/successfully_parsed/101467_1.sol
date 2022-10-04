address public constant USDT_ADDRESS = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

function deposit(uint256 amount) override external payable {
    IERC20 usdt = IERC20(USDT_ADDRESS);
    
}
