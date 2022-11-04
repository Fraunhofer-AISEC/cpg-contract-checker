

pragma solidity 0.8.15;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
     mapping(address=>uint256) public AddressToAmountFunded;

     function fundme() public payable {
         AddressToAmountFunded[msg.sender]+=msg.value;
     }

    
}
