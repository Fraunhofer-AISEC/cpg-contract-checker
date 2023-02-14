

pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract DexB is ERC20("KiaDex","DEX") {

   function SendTokenFromAddress(address token,address sender,address recipient,uint256 amount)
    external {

        IERC20 token = IERC20(token);
        token.allowance(sender,address(token));
        token.approve(sender,amount);
        require(token.balanceOf(sender) >=amount , "your balance is low" ) ;
        token.transferFrom(sender,recipient, amount);
        
    }
}
