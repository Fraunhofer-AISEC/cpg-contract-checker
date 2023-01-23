pragma solidity 0.5.0;

import "./Token/ERC20Basic.sol";
import "./Token/SafeERC20.sol";

contract Faucet {
    event AccountFunded(address account);

    address public tokenAddress;

    constructor(address _tokenAddress) public payable {
        tokenAddress = _tokenAddress;
    }

    function () external payable {}

    function testBalance(address account) public view returns (uint) {
        return ERC20Basic(tokenAddress).balanceOf(account);
    }

    function transfer(address account) public {
        SafeERC20.safeTransfer(ERC20Basic(tokenAddress), account, 10);
        emit AccountFunded(account);
    }
}
