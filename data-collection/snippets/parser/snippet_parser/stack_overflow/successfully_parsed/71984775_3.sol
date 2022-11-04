

pragma solidity ^0.8.0;

import "./burn.sol";

contract BurnOther{

    BurnMe _token;
    constructor(address token_){ 
        _token = BurnMe(token_); 
    }

    function burnOther(uint256 amount) external {
        _token.burn(msg.sender, amount);
    }
}
