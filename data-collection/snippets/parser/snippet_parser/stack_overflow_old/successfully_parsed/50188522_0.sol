pragma solidity ^0.4.15;

import './SSSToken.sol';
import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import "zeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";


contract SSSTokenSale is Crowdsale {
  using SafeMath for uint256;
  uint256 public round;
  uint256 public every;
  MintableToken public token;

  constructor(
    
    
    uint256 _rate,
    address _wallet,
    uint256 _initialMint,
    uint256 _every,
    MintableToken _token
  )
    public
    Crowdsale(_rate, _wallet, _token)
  {
    token = _token;
    
    every = _every;
  }

  
  
  

  function () external payable {
      buyTokens(msg.sender);
  }

  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    
    uint256 weiAmount = msg.value;
    uint256 tokens = weiAmount.mul(rate);
    weiRaised = weiRaised.add(weiAmount);
    round = round.add(1);

    
    if (round % every == 0) {
      tokens = tokens.mul(2);
    }

    token.mint(msg.sender, tokens);
    TokenPurchase(beneficiary, beneficiary, weiAmount, tokens);

    _forwardFunds();
  }
}
