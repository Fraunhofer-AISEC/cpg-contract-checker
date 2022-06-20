pragma solidity ^0.4.18;

import "./SafeMath.sol";
import "./Ownable.sol";
import "./usingOraclize.sol";

contract Test is Ownable, usingOraclize {

  using SafeMath for uint256;

  uint public ETHUSDPriceUINT = 1000000000000000000; 

  function Test(address _tokenAddress, address _multiSigAddress) {

  }

  function buyTokens(string _ETHprice) payable returns (uint) {
      result = _ETHprice; 
      uint ETHContributionInWei = msg.value;
      ETHUSDPriceUINT = parseInt(result, 2); 
      uint exchangeRate = ETHUSDPriceUINT.div(ETHUSDPriceUINT);
      uint USD_Value = ETHContributionInWei.mul(ETHUSDPriceUINT);
      uint tokenFactor = 1250000000000000000 wei;
      uint numTokensIssued = USD_Value.mul(tokenFactor);

      return numTokensIssued;

  }

  function () payable {

  }

}
