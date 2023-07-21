

pragma solidity =0.7.6;
pragma abicoder v2;

import '@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol';
import '@uniswap/v3-core/contracts/libraries/TickMath.sol';
import '@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol';
import '@uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
import '@uniswap/v3-periphery/contracts/base/LiquidityManagement.sol';

contract Liquidity is IERC721Receiver
{
    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F ;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    uint24 public constant poolfee = 3000;

    
    INonfungiblePositionManager public immutable nonfungiblePositionManager = 
    INonfungiblePositionManager(0xC36442b4a4522E871399CD717aBDD847Ab11FE88);
    
    
    
    
    struct Deposit
    {
        address owner;
        uint128 liquidity;
        address token0;
        address token1;
    }

    
    mapping(uint256 => Deposit) public deposit; 

    
    function onERC721Received (address operator, address, uint256 tokenId, bytes calldata) external override returns (bytes4) 
    {
        
        _createDeposit(operator, tokenId);
        return this.onERC721Received.selector;
    }

    
    function _createDeposit(address owner, uint256 tokenID) internal 
    {
        
        (, , address token0, address token1, , , , uint128 liquidity, , , , ) = nonfungiblePositionManager.positions(tokenID);

        deposit[tokenID] = Deposit({owner: owner,liquidity: liquidity,token0: token0, token1: token1});
    }

    
    
    
    
    function mintNewPosition() external returns(uint256 tokenID, uint128 liquidity, uint256 amount0,  uint256 amount1)
    {
        

        uint256 amount0ToMint = 100 * 1e18; 
        uint256 amount1ToMint = 100 * 1e18; 

        
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amount0ToMint);
        TransferHelper.safeTransferFrom(USDC, msg.sender, address(this), amount1ToMint);

        
        TransferHelper.safeApprove(DAI,address(nonfungiblePositionManager), amount0ToMint);
        TransferHelper.safeApprove(USDC,address(nonfungiblePositionManager), amount1ToMint);

        
        INonfungiblePositionManager.MintParams memory params = 
            INonfungiblePositionManager.MintParams({
                token0: DAI,                        
                token1: USDC,                       
                fee: poolfee,                       
                tickLower: TickMath.MIN_TICK,       
                tickUpper: TickMath.MAX_TICK,       
                amount0Desired: amount0ToMint,      
                amount1Desired: amount1ToMint,      
                amount0Min: 0,                      
                amount1Min: 0,                      
                recipient: address(this),           
                deadline: block.timestamp           
            });
        
         
         
         
        (tokenID, liquidity, amount0, amount1) = nonfungiblePositionManager.mint(params);
         

        
        _createDeposit(msg.sender, tokenID);

        
        
        if(amount0 < amount0ToMint)
        {
            TransferHelper.safeApprove(DAI, address(nonfungiblePositionManager), 0);
            uint256 Refund0 = amount0ToMint - amount0; 
            
            
            TransferHelper.safeTransfer(DAI, msg.sender, Refund0);
        }

        if (amount1 < amount1ToMint) 
        {
            TransferHelper.safeApprove(USDC, address(nonfungiblePositionManager), 0);
            uint256 refund1 = amount1ToMint - amount1;
            TransferHelper.safeTransfer(USDC, msg.sender, refund1);
        }
    }

    
    
    
    function CollectAllfee(uint256 TokenID) external returns (uint256 amount0, uint256 amount1)
    {
        
        nonfungiblePositionManager.safeTransferFrom(msg.sender, address(this),TokenID);

        
        INonfungiblePositionManager.CollectParams memory params =
            INonfungiblePositionManager.CollectParams({
                tokenId: TokenID,                   
                recipient: address(this),              
                amount0Max: type(uint128).max,      
                amount1Max: type(uint128).max       
            });

        
        (amount0, amount1) = nonfungiblePositionManager.collect(params);

        
         _sendToOwner(TokenID, amount0, amount1);
    }

    function _sendToOwner(uint256 tokenId, uint256 amount0, uint256 amount1) internal 
    {
        
        address owner = deposit[tokenId].owner;
        address token0 = deposit[tokenId].token0;
        address token1 = deposit[tokenId].token1;
        
        TransferHelper.safeTransfer(token0, owner, amount0);
        TransferHelper.safeTransfer(token1, owner, amount1);
    }
       
    function retrieveNFT(uint256 tokenId) external 
    {
        
        require(msg.sender == deposit[tokenId].owner, 'Not the owner');
        
        nonfungiblePositionManager.safeTransferFrom(address(this), msg.sender, tokenId);
        
        delete deposit[tokenId];
    }
}
