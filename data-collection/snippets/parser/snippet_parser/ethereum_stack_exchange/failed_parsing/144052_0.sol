SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract InsuranceProvider {
    address payable public insurer;
    AggregatorV3Interface internal priceFeed;

    modifier onlyOwner() {
        require(insurer == msg.sender, "Only Insurance provider can do this");
        _;
    }

    constructor() payable {
        priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
        insurer = payable(msg.sender);
    }

    function newContract(
        address payable _client,
        uint256 _premium,
        uint256 _payoutValue
    ) public payable onlyOwner returns (address) {
        
        InsuranceConsumer i = (new InsuranceConsumer){
            value: ((_payoutValue * 1 ether) / (uint256(getLatestPrice())))
        }(_client, _premium, _payoutValue);

        return address(i);
    }

    function getLatestPrice() public view returns (int256) {
        (, int256 price, , uint256 timeStamp, ) = priceFeed.latestRoundData();
        
        require(timeStamp > 0, "Round not complete");
        return price;
    }

    function payOutContract(address _contract) public {
        InsuranceConsumer i = InsuranceConsumer(_contract);
        
        i.payOutContract();
    }

    function refundToInsurer(address _contract) public onlyOwner  {
        InsuranceConsumer i = InsuranceConsumer(_contract);
        
        i.refundToInsurer();
   }
}

contract InsuranceConsumer {
    AggregatorV3Interface internal priceFeed;
    address payable public insurer;
    address payable client;
    uint256 startDate;
    uint256 premium;
    uint256 payoutValue;

    constructor(
        address payable _client,
        uint256 _premium,
        uint256 _payoutValue
    ) payable {
        
        priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );

        
        require(
            msg.value >= _payoutValue / uint256(getLatestPrice()),
            "Not enough funds sent to contract"
        );

        
        insurer = payable(msg.sender);
        client = _client;
        startDate = block.timestamp; 
        premium = _premium;
        payoutValue = _payoutValue;
    }

    function payOutContract() public {
        
        client.transfer(address(this).balance);
    }

    function refundToInsurer() public {
        
        insurer.transfer(address(this).balance);
    }

    function getLatestPrice() public view returns (int256) {
        (, int256 price, , uint256 timeStamp, ) = priceFeed.latestRoundData();
        
        require(timeStamp > 0, "Round not complete");
        return price;
    }
}
