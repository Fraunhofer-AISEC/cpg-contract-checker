
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./../interfaces/IUniswapV2Router.sol";


contract Test is ERC20, Ownable {

    address constant routerAddress = 0x10ED43C718714eb63d5aA57B78B54704E256024E;

    constructor(uint initialSupply, uint tokenAmount) ERC20("Test", "TST") public payable {
        _mint(address(this), initialSupply);
        approve(routerAddress, tokenAmount);
        addLiquidity(address(this), tokenAmount);

        
    }

    function addLiquidity(
        address owner,
        uint256 tokenAmount
    ) internal {

        IUniswapV2Router02 pancakeRouter = IUniswapV2Router02(routerAddress);
        
        pancakeRouter.addLiquidityETH{value: msg.value}(
            address(this),
            tokenAmount,
            0, 
            0, 
            owner,
            block.timestamp + 360
        );
    }

}
