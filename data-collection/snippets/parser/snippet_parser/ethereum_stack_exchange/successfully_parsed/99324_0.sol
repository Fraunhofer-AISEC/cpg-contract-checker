pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Recipient {
    IERC20 private _token;

    event DoneStuff(address from, address to, uint256 amount);

    constructor (address token) public {
        _token = IERC20(token);
    }

    function doStuff() external {
        address from = msg.sender;
        address to = address(this);
        uint256 amount = 1e18;

        _token.transferFrom(from, to, amount);
        emit DoneStuff(from, to, amount);
    }
}
