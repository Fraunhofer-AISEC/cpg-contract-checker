pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/SafeERC20.sol";
import "https://github.com/smartcontractkit/chainlink/contracts/ChainlinkClient.sol";

address public oracle = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;
string[] public cryptoAssets = [
    "BTC",
    "ETH",
    "BNB",
    "XRP",
    "USDT",
    "SOL",
    "MATIC",
    "LTC",
    "AVA",
    "ADA",
    "DOGE",
    "DOT",
    "SHIB",
    "USDC",
    "BUSD"
];
uint256[] public cryptoMarketCap;
uint256[] public cryptoWeights;
uint256 public totalWeight;
uint256 public indexPrice;

constructor() {
}

function updateAssets() public {
    for (uint256 i = 0; i < cryptoAssets.length; i++) {
        
        cryptoMarketCap[i] = Chainlink.Request(oracle, bytes4(keccak256("getMarketCap(string)")), cryptoAssets[i]).value();
    }
    totalWeight = 0;
    for (uint256 i = 0; i < cryptoAssets.length; i++) {
        cryptoWeights[i] = cryptoMarketCap[i];
        totalWeight += cryptoWeights[i];
    }
}

function updatePrice() public {
    uint256 cryptoPricesSum = 0;
    for (uint256 i = 0; i < cryptoAssets.length; i++) {
        
        cryptoPricesSum += Chainlink.Request(oracle, bytes4(keccak256("getPrice(string)")), cryptoAssets[i]).value() * cryptoWeights[i];
    }
    indexPrice = cryptoPricesSum / totalWeight;
}

function buy() public payable {
    require(msg.value == indexPrice);
    msg.sender.transfer(msg.value);
}
function sell(uint256 _value) public {
    require(_value <= address(this).balance);
    msg.sender.transfer(_value * indexPrice);
}

function addLiquidity(address _token, uint256 _marketCap) public {
    require(msg.value == _marketCap);
    require(address(_token).balance >= _marketCap);
    require(!cryptoAssets.contains(_token)); 
    cryptoAssets.push(_token);
    cryptoMarketCap.push(_marketCap);
    cryptoWeights.push(_marketCap);
    totalWeight += _marketCap;
    updatePrice();
}

function removeLiquidity(address _token) public {
    require(cryptoAssets.contains(_token));
    uint256 tokenIndex = cryptoAssets.indexOf(_token);
    totalWeight -= cryptoWeights[tokenIndex];
    cryptoAssets.remove(tokenIndex);
    cryptoMarketCap.remove(tokenIndex);
    cryptoWeights.remove(tokenIndex);
    updatePrice();
}
