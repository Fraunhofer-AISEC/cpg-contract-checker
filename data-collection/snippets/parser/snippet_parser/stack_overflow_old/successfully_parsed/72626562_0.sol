 
 pragma solidity ^0.8.0;

 

 import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";
 import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
 import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";   

contract DAI_txn {

    using SafeERC20 for IERC20;
    IERC20 public token;
    uint public amount;

constructor(
    address _token
) {
    token = IERC20(_token);
    amount = 10;
} 

function deposit_DAI() public returns(bool) {

    
    bool success;

    
    

    
    token.approve(address(this), amount * 2);
    success = token.transferFrom(msg.sender, address(this), amount);

    return success;
} 

function balance() public view returns (uint) {
    return token.balanceOf(address(this));
}
}