pragma solidity >=0.6.6 <0.9.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMe {
    mapping(address => uint256) public addressToAmountFunded; 
    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        
    }
    function getVersion () public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }
}
