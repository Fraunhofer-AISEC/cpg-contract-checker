import "./ERC20.sol";

pragma solidity ^0.6.4;

contract SimpleBank{
    Token tokenContract;

    constructor(Token _tokenContract) public {
        tokenContract = _tokenContract;
    }
    
    function deposit(uint amt) public returns (bool)  {
        require(amt != 0 , "deposit amount cannot be zero");
        tokenContract.transfer(address(this),amt);
        return true;
    }
} 
