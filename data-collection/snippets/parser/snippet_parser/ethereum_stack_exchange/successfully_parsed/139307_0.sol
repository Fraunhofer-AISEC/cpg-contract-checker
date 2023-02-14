
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract tranfer{
    function approve(address tokenadd, uint amount) public {
        IERC20 token = IERC20(tokenadd);
        token.approve(address(this),amount);
    }
    function transfer(address tokenadd,address recipient, uint amount ) public {
        IERC20 token = IERC20(tokenadd);
        token.transferFrom(msg.sender,recipient, amount);
    }
}
