
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferContract {
    function transferFrom(address recipient, uint256 amount) public {
        address token = 0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7; IERC20(token).transferFrom(msg.sender, recipient, amount);
    }

   function transferTokens(uint256 _amount) public {
       require(_amount > 0);
       uint256 input = _amount; 
       address token = 0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7;
       IERC20(token).transferFrom(msg.sender, 0x4B8C40757A00eD0479e4B8293C61d8178E23d2f1, input);
   }
}
