 
pragma solidity 0.8.11;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract fundMe{
    
    mapping( address => uint256) public addressToAmountFunded;
    function fund () public payable {
        addressToAmountFunded[msg.sender]=msg.value;
        uint256 minimumFunding=50*10**18;
        uint256 public value = msg.value;
        require(getConversionRate(msg.value)>=minimumFunding,"You Need To Fund More");
    
    }
    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,)= priceFeed.latestRoundData();
    return uint256(answer);
    }
    function getConversionRate(uint256 _amount) public view returns(uint256){
        uint256 public price=getPrice();

        uint256 ethAmountInUSD = (price * _amount) / 1000000000000000000;
        return ethAmountInUSD;
    }
}
