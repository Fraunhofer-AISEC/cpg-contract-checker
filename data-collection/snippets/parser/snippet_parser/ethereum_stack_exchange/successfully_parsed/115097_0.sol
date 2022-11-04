
pragma solidity ^0.8.7;

interface IERC20{
   
}

contract tokenBuyBack{

    IERC20 public token1;
    IERC20 public token2;
    address public owner1;
    address public owner2;

    constructor(address _token1, address _owner1, address _token2, address _owner2) public { 
        token1 = IERC20(_token1);
        token1 = _owner1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
    }

    function swapA(uint256 amountA) {

        
        tokenA.transferFrom(msg.sender, address(this), amountA);

        
        uint256 fee = amountA / 100; 
        uint256 amountB = amountA - fee;

        
        tokenB.transfer(msg.sender, amountB);
    }

}
