

pragma solidity =0.8.7;

import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract myContract{
    using SafeMathChainlink for uint256;
    mapping(address => uint256) public payTo;

    function Payment() public payable {
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD, "Doesn't satisfy the minimum condition");
        payTo[msg.sender] += msg.value;
    }
}
