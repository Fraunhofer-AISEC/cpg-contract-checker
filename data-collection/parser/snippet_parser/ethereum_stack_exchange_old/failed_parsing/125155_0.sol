using SafeMath for uint256;
IUniswapV2Router02 uniswapV2Router;
IUniswapV2Router02 sushiswapV1Router;
uint deadline;
IERC20 dai;
address daiTokenAddress;
uint256 amountToTrade;
uint256 tokensOut;


constructor(
    address _aaveLendingPool, 
    IUniswapV2Router02 _uniswapV2Router, 
    IUniswapV2Router02 _sushiswapV1Router
    ) FlashLoanReceiverBase(_aaveLendingPool) public {

        
        sushiswapV1Router = IUniswapV2Router02(address(_sushiswapV1Router));
        uniswapV2Router = IUniswapV2Router02(address(_uniswapV2Router));

        
        deadline = block.timestamp + 300; 
}


function executeOperation() {
 
    address  _reserve;    
    uint256  _amount ;     
    uint256  _fee ;       
    bytes calldata _params
  }  external override   
      { 
    require (_amount <= getBalanceInternal(address(this), _reserve) , "Invalid balance")  ;
     
  }
    
    try this.executeArbitrage() {
    } catch Error(string memory) {
        
    } catch (bytes memory) {
        
    }

    
    uint totalDebt = _amount.add(_fee);
    transferFundsBackToPoolInternal(_reserve, totalDebt);
}
