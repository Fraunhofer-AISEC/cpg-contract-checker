

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";



contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;
    address public owner; 

    constructor() public {
        owner = msg.sender; 
    }

    function fund() public payable {
        
        uint256 minimumUSD = 50 * 10 ** 18;
        require(minimumUSD < getConversionRate(msg.value), "You need to spend more ETH!");
        
        
        

        addressToAmountFunded[msg.sender] += msg.value;
        
    
    }

    function getVersion() public view returns(uint256) {
        
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
   }

   function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer*1000000000);
   }

    
   function getConversionRate(uint256 ethAmount) public view returns(uint256) {
       uint256 ethPrice = getPrice();
       uint256 ethAmountInUsd = (ethPrice * ethAmount) / 100000000000000000;
       return ethAmountInUsd;
   }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }

   function withdraw() public onlyOwner payable {
       
       payable(msg.sender).transfer(address(this).balance);
   }


   function payMike(address payable _to, uint256 paycheckInUsd) public payable {
       uint256 ethPrice = getPrice() ;
       uint256 paycheckInWei = (paycheckInUsd) / (ethPrice * 10);
       _to.transfer(paycheckInWei);
   } 

   function balance() public view returns(uint256) {
       return address(this).balance;
   }
}
