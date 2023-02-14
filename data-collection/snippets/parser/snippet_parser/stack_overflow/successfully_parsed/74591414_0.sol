
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract DonationPolygon is ERC20, Ownable {
    address payable public recipient;

    constructor(address payable _recipient) ERC20("Co2 Dept Receipt", "Co2") {
        recipient = _recipient;
    }

    
    function sendDonation() external payable {
        recipient.transfer(msg.value);
        
    }

    
    function _getNativeCurrencyPrice() public pure returns (uint256) {
        return uint256(858700000000000000);
    }
}
