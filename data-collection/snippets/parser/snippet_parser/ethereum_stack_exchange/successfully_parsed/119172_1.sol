   

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

mapping(address => uint256) public adressToAmountFunded;
address[] public funders;
address public owner;

constructor()public{
    owner = msg.sender;
}

function fund() public payable{
    uint256 minUsd = 5 *10**18;
    require(getConversionRate(msg.value) >= minUsd, "Nedovoljno MATIC coina!");
    adressToAmountFunded[msg.sender] += msg.value;
    funders.push(msg.sender);
}  

function getVersion() public view returns (uint256){
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada);
    return priceFeed.version();
}
 
function getPrice() public view returns(uint256){
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada);
    (,int256 answer,,,) = priceFeed.latestRoundData();
    return  uint256(answer * 10000000000);
      
}
  function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 10**18;
        
        return ethAmountInUsd;
     
    }

    modifier OnlyOwner{
         require(msg.sender == owner,"Pogresan Korisnik");
         _;
    }

    function withDraw() public OnlyOwner payable{
    
       payable(msg.sender).transfer(address(this).balance);
       
        
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            adressToAmountFunded[funder] = 0;
        }
        
        funders = new address[](0);
    }

  }
