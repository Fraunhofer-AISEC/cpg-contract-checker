

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IFlashLoanRecipient.sol";
import "./IBalancerVault.sol";
import "./interfaces/IUniswapV2Router02.sol";

contract FlashLoanArbitrage {
    address payable private owner;
    address private vault;
    address private sushiRouter;
    address private quickRouter;
    address private apeRouter;
    address public matic = 0x0000000000000000000000000000000000001010;

    constructor(
        address _vault,
        address _sushiRouter,
        address _quickRouter,
        address _apeRouter
    ) {
        owner = payable(msg.sender);
        sushiRouter = _sushiRouter;
        quickRouter = _quickRouter;
        apeRouter = _apeRouter;
        vault = _vault;
    }

    event FlashLoanResult(
        address indexed token,
        uint256 amountBorrowed,
        uint256 amountProfit,
        uint256 timestamp
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can call this function!");
        _;
    }

    receive() external payable {}

    function withdraw(IERC20 token) private {
        
        uint256 amount = 0;
        require(address(token) != address(0), "Invalid token address");
        if (matic == address(token)) {
            amount = address(this).balance;
            require(amount > 0, "Not enough MATIC token to Withdraw");
            owner.transfer(amount);
        } else {
            amount = token.balanceOf(address(this));
            require(amount > 0, "Not enough token to Withdraw");
            token.transfer(owner, amount);
        }
    }

    function withdrawOnlyOwner(address token) external payable onlyOwner {
        uint256 amount = 0;
        require(address(token) != address(0), "Invalid token address");
        if (matic == token) {
            amount = address(this).balance;
            require(amount > 0, "Not enough MATIC token to WithdrawOnlyOwner");
            payable(msg.sender).transfer(amount);
        } else {
            IERC20 token_transfer = IERC20(token);
            amount = token_transfer.balanceOf(address(this));
            require(amount > 0, "Not enough token to WithdrawOnlyOwner");
            token_transfer.transfer(payable(msg.sender), amount);
        }
    }

    function changeAddresses(
        address _quickRouter,
        address _sushiRouter,
        address _apeRouter,
        address _vault
    ) external onlyOwner {
        sushiRouter = _sushiRouter;
        quickRouter = _quickRouter;
        apeRouter = _apeRouter;
        vault = _vault;
    }

    function balance(address token_address) public view returns (uint256) {
        uint256 Balance = IERC20(token_address).balanceOf(address(this));
        return Balance;
    }

    function swapper(
        address dex_router,
        uint256 _amountIn,
        uint256 _amountOutMin,
        address _tokenIn,
        address _tokenOut,
        uint256 _deadline
    ) private returns (uint256) {
        
        require(
            IERC20(_tokenIn).approve(dex_router, _amountIn),
            "Approve for Swapping failed."
        );
        require(
            _amountIn <= balance(_tokenIn),
            "Error: Actual amount received is less than expected"
        ); 
        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
        uint256 deadline = block.timestamp + _deadline;
        uint256[] memory amounts = IUniswapV2Router02(dex_router)
            .swapExactTokensForTokens(
                _amountIn,
                _amountOutMin,
                path,
                address(this),
                deadline
            );
        require(amounts[1] > 0, "Output amount should be greater than 0");
        return amounts[1];
    }

    function receiveFlashLoan(
        IERC20[] memory tokens,
        uint256[] memory amounts,
        uint256[] memory feeAmounts,
        bytes memory data
    ) external {
        address dexA;
        address dexB;
        address[] memory trade_tokens;
        uint24 fees;
        uint256[] memory outputs;
        (dexA, dexB, trade_tokens, fees, outputs) = abi.decode(
            data,
            (address, address, address[], uint24, uint256[])
        );
        for (uint256 i = 0; i < tokens.length; ++i) {
            IERC20 token = tokens[i];
            uint256 amount = amounts[i] + feeAmounts[i];
            uint256 amountOut0 = 0;
            uint256 amountOut1 = 0;

            amountOut0 = swapper(
                dexA,
                outputs[0],
                outputs[1],
                trade_tokens[0],
                trade_tokens[1],
                3000
            );
            amountOut1 = swapper(
                dexB,
                balance(trade_tokens[1]),
                0,
                trade_tokens[1],
                trade_tokens[0],
                3000
            );

            emit FlashLoanResult(
                trade_tokens[0],
                amounts[i],
                balance(trade_tokens[1]),
                (block.timestamp + 3000)
            );

            token.transfer(vault, amount);
            withdraw(tokens[i]);
        }
    }

    function flashLoan(
        IERC20[] memory tokens,
        uint256[] memory amounts,
        bytes memory userData
    ) external onlyOwner {
        IBalancerVault(vault).flashLoan(
            IFlashLoanRecipient(address(this)),
            tokens,
            amounts,
            userData
        );
    }
}
