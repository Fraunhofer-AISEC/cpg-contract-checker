

pragma solidity ^ 0.8.7;

interface IERC20 {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);
}

interface IPair {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint256);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    event Mint(address indexed sender, uint256 amount0, uint256 amount1);
    event Burn(
        address indexed sender,
        uint256 amount0,
        uint256 amount1,
        address indexed to
    );
    event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint256);

    function factory() external view returns (address);

    function token0() external view returns (address);

    function token1() external view returns (address);

    function getReserves()
        external
        view
        returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);

    function price0CumulativeLast() external view returns (uint256);

    function price1CumulativeLast() external view returns (uint256);

    function kLast() external view returns (uint256);

    function mint(address to) external returns (uint256 liquidity);

    function burn(
        address to
    ) external returns (uint256 amount0, uint256 amount1);

    function swap(
        uint256 amount0Out,
        uint256 amount1Out,
        address to,
        bytes calldata data
    ) external;

    function skim(address to) external;

    function sync() external;

    function initialize(address, address) external;
}

library SafeMath {
    function add(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x + y) >= x, "ds-math-add-overflow");
    }

    function sub(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function mul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }
}

library TransferHelper {
    function safeApprove(address token, address to, uint256 value) internal {
        
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(0x095ea7b3, to, value)
        );
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            "APPROVE_FAILED"
        );
    }

    function safeTransfer(address token, address to, uint256 value) internal {
        
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(0xa9059cbb, to, value)
        );
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            "TRANSFER_FAILED"
        );
    }

    function safeTransferFrom(
        address token,
        address from,
        address to,
        uint256 value
    ) internal {
        
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(0x23b872dd, from, to, value)
        );
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            "TRANSFER_FROM_FAILED"
        );
    }

    function safeTransferETH(address to, uint256 value) internal {
        (bool success, ) = to.call{value: value}(new bytes(0));
        require(success, "TRANSFER_ETH_FAILED");
    }
}

struct CallbackData {
    address baseToken;
    address quoteToken;
    address pair0;
    address pair1;
    uint256 baseAmountIn;
    uint256 quoteAmount;
}

contract FlashLoanUniswapV2 {
    using SafeMath for uint256;
    address payable public owner;

    
    modifier onlyOwner() {
        require(owner == msg.sender, "UNAUTHORIZED");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
    }

    function execute(
        address baseToken,
        address quoteToken,
        address pair0,
        address pair1,
        uint256 baseAmountIn
    ) public {
        
        uint256 quoteAmount;
        uint256 baseAmountOut;
        {
            (uint256 r0base, uint256 r0quote) = getReserves(pair0,baseToken,quoteToken);
            (uint256 r1quote, uint256 r1base) = getReserves(pair1,quoteToken,baseToken);
            quoteAmount = getAmountOut(baseAmountIn, r0base, r0quote);
            baseAmountOut = getAmountOut(quoteAmount, r1quote, r1base);
        }

        require(baseAmountOut > baseAmountIn, "UNPROFITABLE");
        uint256 balanceBefore = IERC20(baseToken).balanceOf(address(this));

        
        uint256 amount0Out;
        uint256 amount1Out;
        {
            (address token0, ) = sortTokens(baseToken, quoteToken);
            (amount0Out, amount1Out) = quoteToken == token0 ? (uint256(0), baseAmountOut) : (baseAmountOut, uint256(0));
        }

        CallbackData memory callbackData;
        callbackData.baseToken = baseToken;
        callbackData.quoteToken = quoteToken;
        callbackData.pair0 = pair0;
        callbackData.pair1 = pair1;
        callbackData.baseAmountIn = baseAmountIn;
        callbackData.quoteAmount = quoteAmount;
        IPair(pair1).swap(
            amount0Out,
            amount1Out,
            address(this),
            abi.encode(callbackData)
        );

        
        uint256 balanceAfter = IERC20(baseToken).balanceOf(address(this));
        require(balanceAfter > balanceBefore, "SOMETHING_IS_WRONG");

        
        TransferHelper.safeTransfer(baseToken,owner,balanceAfter - balanceBefore);
    }

    function uniswapV2Call(
        address,
        uint256,
        uint256,
        bytes calldata data
    ) external {
        _callback(data);
    }

    function _callback(bytes calldata data) internal {
        
        CallbackData memory cb = abi.decode(data, (CallbackData));
        
        TransferHelper.safeTransfer(cb.baseToken, cb.pair0, cb.baseAmountIn);
        (address token0, ) = sortTokens(cb.baseToken, cb.quoteToken);
        (uint256 amount0Out, uint256 amount1Out) = cb.baseToken == token0 ? (uint256(0), cb.quoteAmount) : (cb.quoteAmount, uint256(0));
        IPair(cb.pair0).swap(amount0Out, amount1Out, cb.pair1, new bytes(0));
    }

    

    
    function sortTokens(
        address tokenA,
        address tokenB
    ) internal pure returns (address token0, address token1) {
        require(tokenA != tokenB, "IDENTICAL_ADDRESSES");
        (token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), "ZERO_ADDRESS");
    }

    
    function getReserves(
        address pairAddress,
        address tokenA,
        address tokenB
    ) internal view returns (uint256 reserveA, uint256 reserveB) {
        (address token0, ) = sortTokens(tokenA, tokenB);
        (uint256 reserve0, uint256 reserve1, ) = IPair(pairAddress).getReserves();
        (reserveA, reserveB) = tokenA == token0 ? (reserve0, reserve1) : (reserve1, reserve0);
    }

    
    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) internal pure returns (uint256 amountOut) {
        require(amountIn > 0, "INSUFFICIENT_INPUT_AMOUNT");
        require(reserveIn > 0 && reserveOut > 0, "INSUFFICIENT_LIQUIDITY");
        uint256 amountInWithFee = amountIn.mul(997);
        uint256 numerator = amountInWithFee.mul(reserveOut);
        uint256 denominator = reserveIn.mul(1000).add(amountInWithFee);
        amountOut = numerator / denominator;
    }

    
    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) internal pure returns (uint256 amountIn) {
        require(amountOut > 0, "INSUFFICIENT_OUTPUT_AMOUNT");
        require(reserveIn > 0 && reserveOut > 0, "INSUFFICIENT_LIQUIDITY");
        uint256 numerator = reserveIn.mul(amountOut).mul(1000);
        uint256 denominator = reserveOut.sub(amountOut).mul(997);
        amountIn = (numerator / denominator).add(1);
    }
}
