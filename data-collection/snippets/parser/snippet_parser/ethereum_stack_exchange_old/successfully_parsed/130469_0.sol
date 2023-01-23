

pragma solidity =0.7.6;
pragma abicoder v2;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

import '@uniswap/v3-periphery/contracts/base/PoolInitializer.sol';
import '@uniswap/v3-periphery/contracts/base/PeripheryImmutableState.sol';
import '@uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';

import '@uniswap/v3-core/contracts/libraries/TickMath.sol';

contract TestToken is ERC20 {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    }

    function mint(address recipient, uint256 amount) public {
        _mint(recipient, amount);
    }

}
contract TokenZero is TestToken("TokenZero", "TZRX") {}
contract TokenOne is TestToken("TokenOne", "TONE") {}

contract TestContract {

    uint256 private constant MAX_INT = 2**256 - 1;

    uint24 private constant _pool_fee = 3000;

    TestToken public _zero;
    TestToken public _one;

    Initializer _initializer;

    address public _pool;

    constructor(TestToken zero, TestToken one, Initializer initializer) {
        _initializer = initializer;

        _zero = zero;
        _one = one;

        _zero.mint(address(this), 1000000 * 10**18);
        _one.mint(address(this), 1000000 * 10**18);

        _zero.approve(address(_initializer), MAX_INT);
        _one.approve(address(_initializer), MAX_INT);
    }

    function initializePool() public {

        address token0 = address(0);
        address token1 = address(0);

        if (address(_zero) < address(_one)) {
            token0 = address(_zero);
            token1 = address(_one);
        } else {
            token0 = address(_one);
            token1 = address(_zero);
        }

        uint160 initial_price = 2**96; 

        _pool = 
            _initializer.createAndInitializePoolIfNecessary(
                token0,
                token1,
                _pool_fee,
                initial_price
        );
    }

    function mintPosition() public {
        if (address(_zero) < address(_one)) {
            _initializer.mintPosition(address(_zero), address(_one), _pool_fee);
        } else {
            _initializer.mintPosition(address(_one), address(_zero), _pool_fee);
        }
    }

}

contract Initializer is PoolInitializer {


    INonfungiblePositionManager public immutable nonfungiblePositionManager =
        INonfungiblePositionManager(0xC36442b4a4522E871399CD717aBDD847Ab11FE88);

    uint256 public _tokenId;

    constructor ()
                 PeripheryImmutableState(0x1F98431c8aD98523631AE4a59f267346ea31F984,
                                         0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 
                 )
    {}

    function mintPosition(address token0, address token1, uint24 pool_fee) public returns (uint256 tokenId) {

        uint256 amount0ToMint = 100 * 10**18;
        uint256 amount1ToMint = 100 * 10**18;

        TransferHelper.safeTransferFrom(token0, msg.sender, address(this), amount0ToMint);
        TransferHelper.safeTransferFrom(token1, msg.sender, address(this), amount1ToMint);

        TransferHelper.safeApprove(token0, address(nonfungiblePositionManager), amount0ToMint);
        TransferHelper.safeApprove(token1, address(nonfungiblePositionManager), amount1ToMint);

        INonfungiblePositionManager.MintParams memory params =
            INonfungiblePositionManager.MintParams({
                token0: token0,
                token1: token1,
                fee: pool_fee,
                tickLower: TickMath.MIN_TICK,
                tickUpper: TickMath.MAX_TICK,
                amount0Desired: amount0ToMint,
                amount1Desired: amount1ToMint,
                amount0Min: 0,
                amount1Min: 0,
                recipient: address(this),
                deadline: block.timestamp + 400
            });

        (tokenId, , , ) = nonfungiblePositionManager.mint(params);
        _tokenId = tokenId;
    }

   function getPosition()
        external
        view
        returns (
            uint96 nonce,
            address operator,
            address token0,
            address token1,
            uint24 fee,
            int24 tickLower,
            int24 tickUpper,
            uint128 liquidity,
            uint256 feeGrowthInside0LastX128,
            uint256 feeGrowthInside1LastX128,
            uint128 tokensOwed0,
            uint128 tokensOwed1
        )
    {
        return nonfungiblePositionManager.positions(_tokenId);

    }
}
