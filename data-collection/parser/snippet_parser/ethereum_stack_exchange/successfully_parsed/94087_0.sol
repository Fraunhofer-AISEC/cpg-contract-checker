
pragma solidity ^0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract Test {
    IERC20 public token;

    function getTotalSupply(address addr) public view returns(uint256) {
        return IERC20(addr).totalSupply();
    }
}
