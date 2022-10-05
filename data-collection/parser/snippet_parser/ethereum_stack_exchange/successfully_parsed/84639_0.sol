 contract BuyExample{
          
    IUniswapV2Router02 usi = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
       
        
    function buyDai(uint256 amountOfEther) public payable returns(uint256){
    
    address cryptoToken = 0xc7AD46e0b8a400Bb3C915120d284AafbA8fc4735;
    
          uint deadline = now + 15; 
            usi.swapETHForExactTokens.value(amountOfEther)(0, getPathForETHToToken(cryptoToken), address(this), deadline);
    
            
            msg.sender.call.value(address(this).balance)("");
    
           return 1000;
        
        }

  function getPathForETHToToken(address crypto) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = usi.WETH();
    path[1] = crypto;
    
    return path;
  }

    }
