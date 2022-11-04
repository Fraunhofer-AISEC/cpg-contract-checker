pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./DSmath.sol";

contract Loan is Ownable, DSMath {

...
function createLoan
    (
        uint _loanAmount,
        uint _collateralAmount,
        address _collateralAddress
    ) 
    external {
        require(loaneeToDebt[msg.sender] == 0, "User already owes tokens");
        require
        (
            isCollateralized(_loanAmount, _collateralAmount, _collateralAddress),
            "Collateral posted is insufficient to receive a loan"
        );
        require(tokenPrices[_collateralAddress] != 0, "Collateral token not registered to system");     

        ERC20(_collateralAddress).transferFrom(msg.sender, address(this), _collateralAmount); 

        loaneeToDebt[msg.sender] = _collateralAmount;

    }
