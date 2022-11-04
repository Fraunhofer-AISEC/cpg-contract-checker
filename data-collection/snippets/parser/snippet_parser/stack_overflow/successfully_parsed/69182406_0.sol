    pragma solidity >=0.6.6 <0.9.0;
    
    import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
    
    contract FundMe {
        
        mapping(address => uint256) public addressToAmountFunded;
        function fund() public payable {
            addressToAmountFunded[msg.sender] += msg.value;
        }
        
        function getVersion() public view returns(uint256) {
            AggregatorV3Interface priceFeed = AggregatorV3Interface(0x01BE23585060835E02B77ef475b0Cc51aA1e0709);
            return priceFeed.version();
        }
    }
