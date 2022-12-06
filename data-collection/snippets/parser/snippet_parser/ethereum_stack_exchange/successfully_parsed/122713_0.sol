pragma solidity 0.8.4;

import { ILendingPool, ILendingPoolAddressesProvider, IERC20 } from "./Interfaces.sol";
import { FlashLoanReceiverBase } from "./FlashLoanReceiverBase.sol";
import { IUniswapV2Router } from "./Arbitrage.sol";
import { Withdrawable } from "./Withdrawable.sol";  
import { MoneyPrinter } from "MoneyPrinter.sol";
import { SafeMath } from "./Libraries.sol";
import { Ownable } from "Ownable.sol";



contract DexArbitrageFlashloan is FlashLoanReceiverBase, Ownable, Withdrawable {
event UpdatedArbitrageContract (address oldArbitrageContract, address 
newArbitrageContract);
using SafeMath for uint256;

address _token2;
address _router1;
address _router2;
MoneyPrinter arbitrageContract;
address Dai  = 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063; 

constructor(ILendingPoolAddressesProvider _addressProvider) FlashLoanReceiverBase(_addressProvider) {
    arbitrageContract = MoneyPrinter(arbitrageContract);}

function params(address _router1, address _router2, address _token2) public onlyOwner {}




function executeOperation(
    address[] calldata assets,
    uint256[] calldata amounts,
    uint256[] calldata premiums
    
   
)
    public onlyOwner
    override
    returns (bool)
{

    
    

    DexArbitrageFlashloan.flashloan(
    address(Dai),
     uint256(10) 
    );

    arbitrageContract.DualDexArbitrage(
    address(Dai),
    address(_router1),
    address(_router2),
    address(_token2),
    uint256(1)
    );

    
    
    
    
    

    for (uint i = 0; i < assets.length; i++) {
        uint amountOwing = amounts[i].add(premiums[i]);
        IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
    }

    return true;
}




function flashloan(address _asset, uint256 _amount) public onlyOwner {
   
    uint amount = _amount;

    address[] memory assets = new address[](1);
    assets[0] = _asset;

    uint256[] memory amounts = new uint256[](1);
    amounts[0] = amount;

    flashloan(_asset, _amount);

}

    function setArbitrageContract (address _newArbitrageContract) public onlyOwner {
    address _previousArbitrageContract = address(arbitrageContract);
    arbitrageContract = MoneyPrinter(_newArbitrageContract);
    emit UpdatedArbitrageContract (_previousArbitrageContract, _newArbitrageContract);
   }

}
