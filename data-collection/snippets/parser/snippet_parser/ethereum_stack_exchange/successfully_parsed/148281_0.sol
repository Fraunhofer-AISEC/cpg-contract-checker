

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract TokenUtilizer {

    IERC20 public SBToken;

    constructor(IERC20 _SBTokenAddress) {
        SBToken = _SBTokenAddress;
    }

  
    function approval() public {
        SBToken.approve(address(this), 1000);
    }
}