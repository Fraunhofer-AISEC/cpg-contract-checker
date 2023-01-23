
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
contract TransferTokens {
function transferToMe(address _token, uint _amount) public {
    
    
    IERC20(_token).transferFrom(msg.sender, address(this), _amount);
}
}