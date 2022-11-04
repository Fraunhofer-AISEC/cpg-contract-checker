
pragma solidity ^0.5.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/AllowanceCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/PausableCrowdsale.sol";
import "@chainlink/contracts/src/v0.5/interfaces/AggregatorV3Interface.sol";

contract Swaplast is Crowdsale, AllowanceCrowdsale, PausableCrowdsale {

    AggregatorV3Interface internal priceFeed;
    
    function getCrowdsaleRate() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        price = price / 10 ** 6; 
        price = 1000000000000000000 / price; 
        uint256 a = 10000000000000000000/uint256(85); 
        uint256 exchangeRate = a / uint256(price); 
        return int256(exchangeRate);
    }

    uint256 myrate = uint256(getCrowdsaleRate());
    
    
    constructor(
    uint256 _rate,
    address payable _wallet,
    ERC20 _token,
    address _tokenWallet
  ) 
    
    Crowdsale(myrate, _wallet, _token)
    AllowanceCrowdsale(_tokenWallet)
    public {
        priceFeed = AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526); 
    }

}

