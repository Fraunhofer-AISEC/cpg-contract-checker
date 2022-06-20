contract Crowdsale{
using SafeMath for uint256;


Token public token;


address public wallet;


mapping (uint256 => uint256) public rate;


mapping (uint256 => uint256) public cap;


uint256 public currentTier;


uint256 public tokenRaised  = 0;


uint256 public weiRaised    = 0;

event TokenPurchase(address indexed purchaser, address indexed 
beneficiary, uint256 value, uint256 amount);

function Crowdsale(address _wallet, IWToken _token) public {
require(_wallet != address(0));
require(_token  != address(0));



token = _token;
owner = msg.sender;


rate[1] = 23000;
rate[2] = 22000;
rate[3] = 21000;
rate[4] = 20000;


cap[1] = 100000000000000000;
cap[2] = 200000000000000000;
cap[3] = 300000000000000000;
cap[4] = 1000000000000000000;


currentTier = 1;

wallet = _wallet;


}


function buyTokens(address beneficiary) public payable {
require(beneficiary != address(0));
require(!stopped);
require(msg.value <= 100000000000000000);
require(msg.value > 0);

uint256 weiAmount = msg.value;

uint256 tokens;


if(weiRaised.add(weiAmount) > cap[currentTier]){

  
  uint256 overFunded     = weiRaised.add(weiAmount).sub(cap[currentTier]);
  weiAmount              = msg.value.sub(overFunded);

  
  
  tokens        = weiAmount.mul(rate[currentTier]);
  weiRaised     = weiRaised.add(weiAmount);
  tokenRaised   = tokenRaised.add(tokens);

  
  token.ICOmint(beneficiary, tokens);
  TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
  forwardFunds(weiAmount);

  
  currentTier = currentTier+1;

  if(currentTier > 4){
    
    msg.sender.transfer(overFunded);

    
    stopped = true;
    } else {
     
     tokens        = overFunded.mul(rate[currentTier]);
     weiRaised     = weiRaised.add(overFunded);
     tokenRaised   = tokenRaised.add(tokens);

     
     token.ICOmint(beneficiary, tokens);
     TokenPurchase(msg.sender, beneficiary, overFunded, tokens);
     forwardFunds(overFunded);
   }

   } else {
    
    tokens        = weiAmount.mul(rate[currentTier]);
    weiRaised     = weiRaised.add(weiAmount);
    tokenRaised   = tokenRaised.add(tokens);

    token.ICOmint(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds(msg.value);
  }
}

function forwardFunds(uint256 _amount) internal {
  wallet.transfer(_amount);
}
}