

pragma solidity >=0.5.0 <0.9.0;

import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";

contract TubblySale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {}
}
