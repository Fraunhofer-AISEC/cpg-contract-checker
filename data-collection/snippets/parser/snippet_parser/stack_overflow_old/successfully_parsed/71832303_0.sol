

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/Uniswap/v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Factory.sol";

contract CWCoin is ERC20, Ownable{
    using SafeMath for uint256;

    uint8 liquiFee = 1;

    IUniswapV2Router02 public uniswapV2Router;
    address public uniswapV2Pair;
    bool initialLiqDone = false;

    constructor ()
        ERC20("CWCoin", "CWC"){

            IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(
                0xD99D1c33F9fC3444f8101754aBC46c52416550D1
            );

            address _uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
                .createPair(address(this), _uniswapV2Router.WETH());

            uniswapV2Router = _uniswapV2Router;
            uniswapV2Pair = _uniswapV2Pair;

            _mint(msg.sender, 1000000 * 10 ** uint(decimals()) );
            _mint(address(this), 100000 * 10 ** uint(decimals()) );
    }

    receive() external payable{}

     function swapAndLiquify(uint256 tokens) private {
        
        uint256 half = tokens.div(2);
        uint256 otherHalf = tokens.sub(half);
        uint256 initialBalance = address(this).balance;

        
        swapTokensForEth(half); 

        
        uint256 newBalance = address(this).balance.sub(initialBalance);

        
        addLiquidity(otherHalf, newBalance);
    }


    function addInitialLiquidity() public onlyOwner{

        
        _approve(address(this), address(uniswapV2Router),  ~uint256(0));
        _approve(address(this), address(uniswapV2Pair),  ~uint256(0));

        
        uniswapV2Router.addLiquidityETH{value: address(this).balance}(
            address(this),
            balanceOf(address(this)),
            0, 
            0, 
            owner(),
            block.timestamp
        );

        initialLiqDone = true;

    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        
        _approve(address(this), address(uniswapV2Router), tokenAmount);

        
        uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, 
            0, 
            address(0),
            block.timestamp
        );
    }

    function swapTokensForEth(uint256 tokenAmount) private {
        
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override{
        require(from != address(0), "From not null address");
        require(to != address(0), "To not null address");

        if(amount == 0){
            super._transfer(from, to, 0);
            return;
        }

        uint256 liqui = amount.mul(liquiFee).div(100);

        swapAndLiquify(liqui);

        super._transfer(from, to, amount.sub(liqui));
    }

}
