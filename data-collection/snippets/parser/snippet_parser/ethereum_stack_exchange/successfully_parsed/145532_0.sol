
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface Structs {
    struct Val {
        uint256 value;
    }

    enum ActionType {
        Deposit, 
        Withdraw, 
        Transfer, 
        Buy, 
        Sell, 
        Trade, 
        Liquidate, 
        Vaporize, 
        Call 
    }

    enum AssetDenomination {
        Wei 
    }

    enum AssetReference {
        Delta 
    }

    struct AssetAmount {
        bool sign; 
        AssetDenomination denomination;
        AssetReference ref;
        uint256 value;
    }

    struct ActionArgs {
        ActionType actionType;
        uint256 accountId;
        AssetAmount amount;
        uint256 primaryMarketId;
        uint256 secondaryMarketId;
        address otherAddress;
        uint256 otherAccountId;
        bytes data;
    }

    struct Info {
        address owner; 
        uint256 number; 
    }

    struct Wei {
        bool sign; 
        uint256 value;
    }
}

abstract contract DyDxPool is Structs {
    function getAccountWei(Info memory account, uint256 marketId)
        public
        view
        virtual
        returns (Wei memory);

    function operate(Info[] memory, ActionArgs[] memory) public virtual;
}

contract DyDxFlashLoan is Structs {
    DyDxPool pool = DyDxPool(0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e);

    address public WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    mapping(address => uint256) public currencies;

    constructor() {
        currencies[WETH] = 1;
    }

    modifier onlyPool() {
        require(
            msg.sender == address(pool),
            "FlashLoan: could be called by DyDx pool only"
        );
        _;
    }

    function tokenToMarketId(address token) public view returns (uint256) {
        uint256 marketId = currencies[token];
        require(marketId != 0, "FlashLoan: Unsupported token");
        return marketId - 1;
    }

    
    function flashloan(
        address token,
        uint256 amount,
        bytes memory data
    ) internal {
        IERC20(token).approve(address(pool), amount + 1);
        Info[] memory infos = new Info[](1);
        ActionArgs[] memory args = new ActionArgs[](3);

        infos[0] = Info(address(this), 0);

        AssetAmount memory wamt = AssetAmount(
            false,
            AssetDenomination.Wei,
            AssetReference.Delta,
            amount
        );
        ActionArgs memory withdraw;
        withdraw.actionType = ActionType.Withdraw;
        withdraw.accountId = 0;
        withdraw.amount = wamt;
        withdraw.primaryMarketId = tokenToMarketId(token);
        withdraw.otherAddress = address(this);

        args[0] = withdraw;

        ActionArgs memory call;
        call.actionType = ActionType.Call;
        call.accountId = 0;
        call.otherAddress = address(this);
        call.data = data;

        args[1] = call;

        ActionArgs memory deposit;
        AssetAmount memory damt = AssetAmount(
            true,
            AssetDenomination.Wei,
            AssetReference.Delta,
            amount + 1
        );
        deposit.actionType = ActionType.Deposit;
        deposit.accountId = 0;
        deposit.amount = damt;
        deposit.primaryMarketId = tokenToMarketId(token);
        deposit.otherAddress = address(this);

        args[2] = deposit;

        pool.operate(infos, args);
    }
}

contract Arbitrage is DyDxFlashLoan {
    IUniswapV2Router02 immutable uRouter;
    IUniswapV2Router02 immutable sRouter;

    address public owner;

    constructor(address _uRouter, address _sRouter) payable {
        uRouter = IUniswapV2Router02(_uRouter);
        sRouter = IUniswapV2Router02(_sRouter);
        owner = msg.sender;
        (bool success, ) = WETH.call{value: msg.value}("");
        require(success, "fail to get weth");
    }

    function executeTrade(
        address _tokenA,
        address _tokenB,
        uint _tokensFromFlashLoan,
        bool _startOnUniswap
    ) external {
        uint balanceBefore = IERC20(_tokenA).balanceOf(address(this));

        bytes memory data = abi.encode(
            _startOnUniswap,
            _tokenA,
            _tokenB,
            _tokensFromFlashLoan,
            balanceBefore
        );

        flashloan(_tokenA, _tokensFromFlashLoan, data);
    }

    function callFunction(
        address,
        Info calldata,
        bytes calldata data
    ) external onlyPool {
        (
            bool _startOnUniswap,
            address _tokenA,
            address _tokenB,
            uint256 _tokensFromFlashLoan,
            uint256 balanceBefore
        ) = abi.decode(data, (bool, address, address, uint256, uint256));
        uint balanceAfter = IERC20(_tokenA).balanceOf(address(this));

        require(
            balanceAfter - balanceBefore == _tokensFromFlashLoan,
            "Didn't receive flash loan"
        );

        address[] memory tokens;
        if (_startOnUniswap == true) {
            tokens[0] = _tokenA;
            tokens[1] = _tokenB;

            swapOnUniswap(_tokensFromFlashLoan, 10, tokens);

            tokens[0] = _tokenB;
            tokens[1] = _tokenA;

            swapOnSushiswap(
                IERC20(tokens[0]).balanceOf(address(this)),
                10,
                tokens
            );
        } else {
            tokens[0] = _tokenA;
            tokens[1] = _tokenB;

            swapOnSushiswap(_tokensFromFlashLoan, 10, tokens);

            tokens[0] = _tokenB;
            tokens[1] = _tokenA;

            swapOnUniswap(
                IERC20(tokens[0]).balanceOf(address(this)),
                10,
                tokens
            );
        }
    }

    function swapOnUniswap(
        uint _amountIn,
        uint _amountOut,
        address[] memory _path
    ) internal {
        
        
        
        require(
            IERC20(_path[0]).approve(address(uRouter), _amountIn),
            "Uniswap failed the approval"
        );

        
        uRouter.swapExactTokensForTokens(
            _amountIn,
            _amountOut,
            _path,
            address(this),
            (block.timestamp + 1200)
        );
    }

    function swapOnSushiswap(
        uint _amountIn,
        uint _amountOut,
        address[] memory _path
    ) internal {
        require(
            IERC20(_path[0]).approve(address(sRouter), _amountIn),
            "Sushiswap failed the approval"
        );

        uRouter.swapExactTokensForTokens(
            _amountIn,
            _amountOut,
            _path,
            address(this),
            (block.timestamp + 1200)
        );
    }
}