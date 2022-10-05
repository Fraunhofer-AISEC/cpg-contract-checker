
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/finance/VestingWallet.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VestingContract is VestingWallet {
    constructor(
        address beneficiaryAddress,
        uint64 startTimestamp,
        uint64 durationSeconds
    )
        public
        VestingWallet(beneficiaryAddress, startTimestamp, durationSeconds)
    {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getBalanceFromToken(address _token) public view returns (uint256) {
        return IERC20(_token).balanceOf(address(this));
    }
}
