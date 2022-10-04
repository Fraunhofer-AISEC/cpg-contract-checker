pragma solidity >=0.6.0 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract UTO is ERC20, Ownable, Pausable {

    string private _name = "UnlimitedToken";
    string private _symbol = "UTO";

    uint256 public tokensPerEth;            
    uint256 public tokenValue;              
    uint256 public percentForBeneficiary;   
    address public beneficiary;             

    constructor(address _beneficiary, uint256 _tokensPerEth, uint256 _percentForBeneficiary) ERC20(_name, _symbol) public {
        tokensPerEth = _tokensPerEth;
        tokenValue = 1 wei;    
        beneficiary = _beneficiary;
        percentForBeneficiary = _percentForBeneficiary;
    }

    
    function setBeneficiary(address newBeneficiary) public onlyOwner {
        require(newBeneficiary != address(0), "Invalid address for beneficiary");
        beneficiary = newBeneficiary;
    }

}
