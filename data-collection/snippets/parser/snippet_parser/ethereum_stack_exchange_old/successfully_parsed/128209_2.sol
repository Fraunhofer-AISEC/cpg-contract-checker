pragma solidity >=0.6.6 <0.8.0;

import { IERC20 } from "../interfaces/IERC20.sol";

import { ILendingPool } from "../interfaces/ILendingPool.sol";

contract LandLord {

    IERC20 public tokenUsedForPayments;
    ILendingPool public aavePool;

    event printme(address aavePool, uint256 _amount, address sender, address tokenUsedForPayments);

    constructor (
        address _tokenUsedToPay,
        address _lendingService 
    ) public {
        tokenUsedForPayments = IERC20(_tokenUsedToPay);
        aavePool = ILendingPool(_lendingService);
    }

    function transferToAave(uint256 _amount) public {
        
        
        
        
        

        aavePool.deposit(address(tokenUsedForPayments), _amount, address(msg.sender), 0);

        emit printme(address(aavePool), _amount, address(msg.sender), address(tokenUsedForPayments));

    }
}