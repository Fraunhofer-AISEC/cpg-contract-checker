pragma solidity 0.6.0 ;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    mapping (address => uint256) public addressToAmountFunded;
    
    constructor() payable {}

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    }
} 

