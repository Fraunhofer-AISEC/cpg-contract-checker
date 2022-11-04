
pragma solidity ^0.8.0;
pragma abicoder v2;

import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';


contract SwapExamples is ERC20 {
    
    
    
    
    

    ISwapRouter public immutable swapRouter;
    address payable [] private s_Wallets;
    uint256 public walletA = address(this).balance;

    

    address public constant WETH = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6; 


    
    uint24 public constant poolFee = 3000;
    uint256 public UsdOut;

    constructor(ISwapRouter _swapRouter) ERC20("Wrapped Ether", "WETH") {
        swapRouter = _swapRouter;
    }
    function Deposit() public payable {

        s_Wallets.push(payable(msg.sender));
            
    } 

    function Mint() external payable {
        _mint(address(this), address(this).balance);
    }

}
